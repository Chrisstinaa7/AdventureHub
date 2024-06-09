import 'package:adventurehub/plans/sharedprefhelper.dart';
import 'package:adventurehub/plans/plans.dart';
import 'package:flutter/material.dart';

class PlansScreen extends StatefulWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  State<PlansScreen> createState() => _PlansScreenState();
}

class _PlansScreenState extends State<PlansScreen> {
  SharedPrefHelper sharedPrefHelper = SharedPrefHelper();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerPlanDetail = TextEditingController();
  List<PlansActivity> listAllPlans = [];
  List<PlansActivity> filteredPlans = [];
  int counter = 1;
  int numberOfPersons = 1;
  int numberOfRooms = 1;

  @override
  void initState() {
    super.initState();
    fetchPlans();
  }

  void fetchPlans() async {
    await sharedPrefHelper.init();
    setState(() {
      listAllPlans = sharedPrefHelper.getAllPlansData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Travel Plans",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(), //for flexible layout
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: PlansSearch(listAllPlans));
              },
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 48, 77, 31),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/myplans.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: populateAllData(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddPlansActivity,
        child: Icon(Icons.add),
      ),
    );
  }

  Future onAddPlansActivity() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Provide following information"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: controllerDate,
                  readOnly: true,
                  onTap: _showDatePicker,
                  decoration: InputDecoration(hintText: "Trip Date"),
                ),
                TextField(
                  controller: controllerPlanDetail,
                  decoration: InputDecoration(hintText: "Destination Name"),
                )
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controllerDate.text = "";
                controllerPlanDetail.text = "";
                setState(() {});
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String date = controllerDate.text;
                String planDetail = controllerPlanDetail.text;
                int savedCounter = sharedPrefHelper.getExistingCounter();
                PlansActivity activity = PlansActivity(
                  savedCounter.toString(),
                  date,
                  planDetail,
                );

                activity.numberOfRooms = numberOfRooms;
                activity.numberOfPersons = numberOfPersons;

                counter++;
                sharedPrefHelper.savePlansRecord(activity);

                print('Saved plan: $activity');

                Navigator.pop(context);
                controllerDate.text = "";
                controllerPlanDetail.text = "";

                fetchPlans();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future _showDatePicker() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(
        DateTime.now().year,
        DateTime.now().month + 1,
        DateTime.now().day,
      ),
      initialDate: DateTime.now(),
    );

    if (pickedDate != null) {
      controllerDate.text = pickedDate.day.toString() +
          "/" +
          pickedDate.month.toString() +
          "/" +
          pickedDate.year.toString();

      setState(() {});
    }
  }

  List<Widget> populateAllData() {
    List<Widget> listTiles = [];
    for (var plan in filteredPlans.isNotEmpty ? filteredPlans : listAllPlans) {
      int numberOfRooms = 1;

      listTiles.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 95, 134, 87).withOpacity(0.3),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Dismissible(
            key: UniqueKey(), //for each item
            onDismissed: (_) {
              sharedPrefHelper.removePlansRecord(plan.id).then((value) {
                listAllPlans = sharedPrefHelper.getAllPlansData();
                setState(() {});
              });
            },
            child: ListTile(
              title: Row(
                children: [
                  Expanded(
                    child: Text(
                      plan.planDetail,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.hotel, color: Colors.white),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Number of Rooms'),
                            content: StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            setState(() {
                                              if (numberOfRooms > 1) {
                                                numberOfRooms--;
                                              }
                                            });
                                          },
                                        ),
                                        Text(
                                          '$numberOfRooms',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              numberOfRooms++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  plan.numberOfRooms = numberOfRooms;
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Number of Persons'),
                            content: StatefulBuilder(
                              builder:
                                  (BuildContext context, StateSetter setState) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            setState(() {
                                              if (numberOfPersons > 1) {
                                                numberOfPersons--;
                                              }
                                            });
                                          },
                                        ),
                                        Text(
                                          '$numberOfPersons',
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              numberOfPersons++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  plan.numberOfPersons = numberOfPersons;
                                  Navigator.pop(context);
                                  setState(() {});
                                },
                                child: Text('Save'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              subtitle: Text(
                plan.date,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rooms: ${plan.numberOfRooms}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Persons: ${plan.numberOfPersons}',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return listTiles;
  }

  void filterPlans(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredPlans = listAllPlans
            .where((plan) =>
                plan.planDetail.toLowerCase().contains(query.toLowerCase()) ||
                plan.date.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredPlans = [];
      });
    }
  }
}

class PlansSearch extends SearchDelegate<String> {
  final List<PlansActivity> plans;

  PlansSearch(this.plans);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = plans
        .where((plan) =>
            plan.planDetail.toLowerCase().contains(query.toLowerCase()) ||
            plan.date.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results[index];
        return ListTile(
          title: Text(result.planDetail),
          subtitle: Text(result.date),
          onTap: () {
            close(context, result.planDetail);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = plans
        .where((plan) =>
            plan.planDetail.toLowerCase().contains(query.toLowerCase()) ||
            plan.date.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion.planDetail),
          subtitle: Text(suggestion.date),
          onTap: () {
            query = suggestion.planDetail;
          },
        );
      },
    );
  }
}

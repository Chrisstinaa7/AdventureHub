import 'package:flutter/material.dart';
import 'package:adventurehub/common/menudrawer.dart';

class TripBudgetScreen extends StatefulWidget {
  const TripBudgetScreen({Key? key}) : super(key: key);

  @override
  _TripBudgetScreenState createState() => _TripBudgetScreenState();
}

class _TripBudgetScreenState extends State<TripBudgetScreen> {
  TextEditingController _controllerTransportation = TextEditingController();
  TextEditingController _controllerAccommodation = TextEditingController();
  TextEditingController _controllerMeals = TextEditingController();
  TextEditingController _controllerActivities = TextEditingController();
  TextEditingController _controllerMiscellaneous = TextEditingController();

  List<ExpenseRecord> _expenseRecords = [];

  String _hintTransportation = "Enter transportation expenses";
  String _hintAccommodation = "Enter accommodation expenses";
  String _hintMeals = "Enter meals expenses";
  String _hintActivities = "Enter activities expenses";
  String _hintMiscellaneous = "Enter miscellaneous expenses";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        backgroundColor: Colors.blueGrey,
      ),
       body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/boat.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter, // to align the image to the bottom of the container
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.7),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTripPlannerSection(),
              SizedBox(height: 32.0),
              _buildExpenseTrackerSection(),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _calculateTripBudget,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 250, 223, 246),
                ),
                child: Text(
                  "Calculate Trip Budget",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: MenuDrawer(),
    );
  }
  Widget _buildTripPlannerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Budget Required",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        _buildTextField(_controllerTransportation, _hintTransportation),
        SizedBox(height: 8.0),
        _buildTextField(_controllerAccommodation, _hintAccommodation),
        SizedBox(height: 8.0),
        _buildTextField(_controllerMeals, _hintMeals),
        SizedBox(height: 8.0),
        _buildTextField(_controllerActivities, _hintActivities),
        SizedBox(height: 8.0),
        _buildTextField(_controllerMiscellaneous, _hintMiscellaneous),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.black)),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        ),
      ),
    );
  }

  Widget _buildExpenseTrackerSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Expense Tracker",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: _addExpenseRecord,
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 250, 223, 246),
          ),
          child: Text(
            "Add Expense Record",
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(height: 8.0),
        ListView.builder(
          shrinkWrap: true,
          itemCount: _expenseRecords.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 254, 254).withOpacity(0.6),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text("Expense ${index + 1}"),
                subtitle: Text(
                  "Amount: \$${_expenseRecords[index].amount.toStringAsFixed(2)}",
                ),
              ),
              
            );
          },
        ),
      ],
    );
  }

  void _addExpenseRecord() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _controllerAmount = TextEditingController();
        return AlertDialog(
          title: Text(
            "Add Expense Record",
            style: TextStyle(color: Color.fromARGB(0, 0, 0, 0)),
          ),
          content: TextField(
            controller: _controllerAmount,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Enter amount",
              border: OutlineInputBorder(), 
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                double amount = double.tryParse(_controllerAmount.text) ?? 0.0;
                _expenseRecords.add(ExpenseRecord(amount: amount));
                Navigator.pop(context);
                setState(() {});
              },
              child: Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _calculateTripBudget() {
    double transportationExpenses =
        double.tryParse(_controllerTransportation.text) ?? 0.0;
    double accommodationExpenses =
        double.tryParse(_controllerAccommodation.text) ?? 0.0;
    double mealsExpenses = double.tryParse(_controllerMeals.text) ?? 0.0;
    double activitiesExpenses =
        double.tryParse(_controllerActivities.text) ?? 0.0;
    double miscellaneousExpenses =
        double.tryParse(_controllerMiscellaneous.text) ?? 0.0;

    double totalTripExpenses = transportationExpenses +
        accommodationExpenses +
        mealsExpenses +
        activitiesExpenses +
        miscellaneousExpenses;

    double totalExpenseRecords = 0.0;
    for (var record in _expenseRecords) {
      totalExpenseRecords += record.amount;
    }

    double remainingBudget = totalTripExpenses - totalExpenseRecords;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Trip Budget Summary"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Total Trip Budget Needed: \$${totalTripExpenses.toStringAsFixed(2)}"),
              Text(
                  "Total Expense Records: \$${totalExpenseRecords.toStringAsFixed(2)}"),
              Text("Remaining Budget: \$${remainingBudget.toStringAsFixed(2)}"),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class ExpenseRecord {
  final double amount;

  ExpenseRecord({required this.amount});
}

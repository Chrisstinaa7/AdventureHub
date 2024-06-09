import 'dart:convert';

class PlansActivity {
  String id = "";
  String date = "";
  String planDetail = "";

  int numberOfRooms = 1;
  int numberOfPersons = 1;

  PlansActivity(this.id, this.date, this.planDetail,
      {this.numberOfRooms = 1, this.numberOfPersons = 1});

  String toJsonString() {
    String encodedString = json.encode({  //to store data in shared preferences
      "id": id,
      "date": date,
      "planDetail": planDetail,
      "numberOfRooms": numberOfRooms,
      "numberOfPersons": numberOfPersons
    });
    return encodedString;
  }

 PlansActivity.fromJsonString(String jsonString) {  //to fetch data from shared preferences
  var dataMap = json.decode(jsonString);
  id = dataMap["id"] ?? "";
  date = dataMap["date"] ?? "";
  planDetail = dataMap["planDetail"] ?? "";
  numberOfRooms = dataMap["numberOfRooms"] ?? 1; 
  numberOfPersons = dataMap["numberOfPersons"] ?? 1; 

}}

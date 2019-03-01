import 'package:flutter/material.dart';

//import 'package:pilotvoice/main.dart';


//   TODO: Need to change this from StatelessWidget to StatefulWidget
class CustomScreen extends StatefulWidget {
  CustomScreen({Key key, this.title}) : super (key: key);

  final String title;

  @override
  CustomScreenState createState() => new CustomScreenState();

}

class CustomScreenState extends State<CustomScreen>  {
  //String dropdownValue;

  // ignore: unused_field
  String selectedAirport;
  String selectedAction;
  String selectedAircraft;
  String selectedHeading;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          children: <Widget>[

            SizedBox(
              height: 20.0,
            ),
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 60.0,
                width: 325.0,
                child: Row(
                  children: <Widget>[
                     Center (

                      child: new DropdownButton<String>(
                        onChanged: (String newVal) {

                          setState(() {
                            selectedAirport = newVal;

                            print("Selected: ${selectedAirport}");
                          });
                        },
                        value: selectedAirport,
                        items: <String>['50R LocakHart', '3T5 Fayette', '84R Smithville', 'T91 Carter', 'GYB Giddings', 'T20 Dreyer', 'HYI San Macros', '66R Wells', 'RYW Lago Vista', '1T8 Bulverde', '3R9 Lakeway', 'T82 Gillespie'].map<DropdownMenuItem<String>>((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: Text("Airport"),




                        ),
                    ),

                      new DropdownButton<String>(
                        onChanged: (String newVal) {

                          setState(() {
                            selectedHeading = newVal;
                            print("Selected: ${selectedHeading}");
                          });
                        },
                        value: selectedHeading,
                        items: <String>['18', '36', '16', '35', '17', '35', '13', '31', '8', '26', '14', '32'].map<DropdownMenuItem<String>>((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Heading"),



                      ),


                  ],

                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 60.0,
                width: 325.0,
                child: Row(
                  children: <Widget>[
                    Expanded (
                      child: new DropdownButton<String>(
                        onChanged: (String newVal) {

                          setState(() {
                            selectedAircraft = newVal;
                            print("Selected: ${selectedAircraft}");
                          });
                        },
                        value: selectedAircraft,
                        items: <String>['Tomahawk 	9 1 3 7 2', 'Warrior 	4 7 4 2 6', 'Cessna 	2 0 7 8 Z', 'Cessna 	7 3 5 K K'].map<DropdownMenuItem<String>>((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Aircraft"),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 60.0,
                width: 325.0,
                child: Row(
                  children: <Widget>[
                    Expanded (
                      child: new DropdownButton<String>(
                        onChanged: (String newVal) {

                          setState(() {
                            selectedAction = newVal;
                            print("Selected: ${selectedAction}");
                          });
                        },
                        value: selectedAction,
                        items: <String>['Downwind', 'Base', 'Final'].map<DropdownMenuItem<String>>((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Action"),

                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 165.0,
                width: 325.0,
                child: Row(
                  children: <Widget>[
                    Expanded (
                      child: new Text(
                        'Script:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

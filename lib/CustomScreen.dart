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
  String _selectedAirport = 'Airport Name;


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
                width: 200.0,
                child: Row(
                  children: <Widget>[
                    Expanded (
                      child: new DropdownButton<String>(

                          items: <String>['50R LocakHart', '3T5 Fayette', '84R Smithville', 'T91 Carter', 'GYB Giddings', 'T20 Dreyer', 'HYI San Macros', '66R Wells', 'RYW Lago Vista', '1T8 Bulverde', '3R9 Lakeway', 'T82 Gillespie'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          hint: Text("Airport Name"),

                          onChanged: (newVal) {
                            _selectedAirport = newVal;
                            this.setState(() {});
                          },
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
                      child: new Text(
                        'Aircraft:',
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
                      child: new Text(
                        'Action:',
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

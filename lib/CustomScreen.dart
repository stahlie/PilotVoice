import 'package:flutter/material.dart';
//import 'package:flutter_tts/flutter_tts.dart';
//import 'package:package_info/package_info.dart';
import 'dbHandler.dart';
import 'AirportModel.dart';



//   TODO: Add Text-to-Speech
//    TODO: Add SQFlite to work with database

class CustomScreen extends StatefulWidget {
 // CustomScreen({Key key, this.title}) : super (key: key);

 // final String title;

  @override
  CustomScreenState createState() => new CustomScreenState();

}


class CustomScreenState extends State<CustomScreen>  {
  DBProvider db = DBProvider();

  String selectedAirport;
  String selectedAction;
  String selectedAircraft;
  String selectedHeading;
  String scriptLine;


  AirportModel _currentAirport;



  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width*0.95;
    return  Scaffold(
      body:  Center(
        child:  Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Card(
              color: Colors.white,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 60.0,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                      FutureBuilder<List<AirportModel>>(
                        future: db.getAllAirports(),
                        builder: (BuildContext context, AsyncSnapshot<List<AirportModel>> snapshot) {
                          if (!snapshot.hasData) return CircularProgressIndicator();
                           return DropdownButton<AirportModel>(items: snapshot.data.map((airportItem) =>
                                DropdownMenuItem<AirportModel>(
                                  child: Text(airportItem.airportName),
                                  value: airportItem,
                                ))
                                .toList(),
                            onChanged: (AirportModel value) {
                              setState(() {
                                if (snapshot.hasData) debugPrint(
                                    "--------- snapshot is ${snapshot.data}");
                                _currentAirport = value;
                                selectedAirport = _currentAirport.airportName;
                              });
                            },
                            value: _currentAirport,
                            hint: Text("Airport"),
                          );
                        }),

                       DropdownButton<String>(
                        onChanged: (String newVal) {
                          setState(() {
                            selectedHeading = newVal;
                            debugPrint("Selected: $selectedHeading");
                          });
                        },
                        value: selectedHeading,
                        items: <String>['18', '36', '16', '35', '17', '13', '31', '8', '26', '14', '32'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 60.0,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
               // width: 325.0,
                child: Row(
                  children: <Widget>[

                    Expanded (

                      child: DropdownButton<String>(
                        onChanged: (String newVal) {

                          setState(() {
                            selectedAircraft = newVal;
                            print("Selected: $selectedAircraft");
                          });
                        },
                        value: selectedAircraft,
                        items: <String>['Tomahawk 	9 1 3 7 2', 'Warrior 	4 7 4 2 6', 'Cessna 	2 0 7 8 Z', 'Cessna 	7 3 5 K K'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                height: 60.0,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: <Widget>[

                       DropdownButton<String>(
                        onChanged: (String newVal) {
                          print('==== newVal is $newVal');
                          setState(() {
                            selectedAction = newVal;
                            print("Selected: $selectedAction");
                          });
                        },
                        value: selectedAction,
                        items: <String>['Downwind', 'Base', 'Final'].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Action"),

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
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
                child: Column (
                  children: <Widget>[
                    Container (
                      height: 165.0,
                      width: cWidth,
                      padding: const EdgeInsets.all( 15.0),
                      child: Text(
                        '$selectedAirport traffic, $selectedAircraft, $selectedAction $selectedHeading, $selectedAirport',
                        textAlign: TextAlign.left,
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
            SizedBox(
              height: 30.0,
            ),
            FlatButton(
              child: Icon(Icons.play_circle_filled,
              size: 100,
                  color: Colors.grey[700],
              ),

              onPressed: () {},
            ),
          ],
        ),
      ),

    );
  }


}


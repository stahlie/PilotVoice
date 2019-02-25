import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(

          children: <Widget>[
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                height: 60.0,
                width: 200.0,
                child: Row(
                  children: <Widget>[
                    Expanded (
                      child: new Text(
                        'Airport:',
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
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
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
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
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
            Card(
              color: Colors.white,
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
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

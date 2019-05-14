import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:package_info/package_info.dart';
import 'dbHandler.dart';
import 'AirportModel.dart';
import 'dart:io';




class CustomScreen extends StatefulWidget {
 // CustomScreen({Key key, this.title}) : super (key: key);

 // final String title;

  @override
  CustomScreenState createState() => new CustomScreenState();

}

enum TtsState { playing, stopped }

class CustomScreenState extends State<CustomScreen>  {
  DBProvider db = DBProvider();

  String selectedAirport;
  String selectedAction;
  String selectedAircraft;
  String selectedHeading;
  String scriptLine;

  AirportModel _currentAirport;

  FlutterTts flutterTts;
  dynamic languages;
  dynamic voices;
  String language;
  String voice;

  String _newVoiceText;

  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;
  get isStopped => ttsState == TtsState.stopped;

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    if (Platform.isAndroid) {
      flutterTts.ttsInitHandler(() {
        _getLanguages();
        _getVoices();
      });
    } else if (Platform.isIOS) {
      _getLanguages();
    }

    flutterTts.setStartHandler(() {
      setState(() {
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setErrorHandler((msg) {
      setState(() {
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getLanguages() async {
    languages = await flutterTts.getLanguages;
    if (languages != null) setState(() => languages);
  }

  Future _getVoices() async {
    voices = await flutterTts.getVoices;
    if (voices != null) setState(() => voices);
  }

  Future _speak() async {
    _newVoiceText = '$selectedAirport traffic, $selectedAircraft, $selectedAction $selectedHeading, $selectedAirport';
    if (_newVoiceText != null) {
      if (_newVoiceText.isNotEmpty) {
        var result = await flutterTts.speak(_newVoiceText);
        if (result == 1) setState(() => ttsState = TtsState.playing);
      }
    }
  }

  Future _stop() async {
    var result = await flutterTts.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  List<DropdownMenuItem<String>> getLanguageDropDownMenuItems() {
    var items = List<DropdownMenuItem<String>>();
    for (String type in languages) {
      items.add(DropdownMenuItem(value: type, child: Text(type)));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getVoiceDropDownMenuItems() {
    var items = List<DropdownMenuItem<String>>();
    for (String type in voices) {
      items.add(DropdownMenuItem(value: type, child: Text(type)));
    }
    return items;
  }

  void changedLanguageDropDownItem(String selectedType) {
    setState(() {
      language = selectedType;
      flutterTts.setLanguage(language);
    });
  }

  void changedVoiceDropDownItem(String selectedType) {
    setState(() {
      voice = selectedType;
      flutterTts.setVoice(voice);
    });
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }



  Widget inputSection() => Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: TextField(
        onChanged: (String value) {
          _onChange(value);
        },
      ));

  Widget btnSection() => Container(
      padding: EdgeInsets.only(top: 5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        _buildButtonColumn(
            Colors.green, Colors.greenAccent, Icons.play_arrow, 'PLAY', _speak),
        _buildButtonColumn(
            Colors.red, Colors.redAccent, Icons.stop, 'STOP', _stop)
      ]));

  Widget languageDropDownSection() => Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        DropdownButton(
          value: language,
          items: getLanguageDropDownMenuItems(),
          onChanged: changedLanguageDropDownItem,
        )
      ]));

  Widget voiceDropDownSection() => Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        DropdownButton(
          value: voice,
          items: getVoiceDropDownMenuItems(),
          onChanged: changedVoiceDropDownItem,
        )
      ]));

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }



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
                           return DropdownButton<AirportModel>(
                                items: snapshot.data
                                    .map((airportItem) => DropdownMenuItem<AirportModel>(
                                  child: Text(airportItem.airportName),
                                  value: airportItem,
                                ))
                                .where((eachItem) => eachItem != null).toList(),

                             onChanged: (AirportModel newvalue) {
                              setState(() {
                               // if (snapshot.hasData) debugPrint(
                                //    "--------- snapshot is ${snapshot.data}");
                                _currentAirport = newvalue;
                                selectedAirport = _currentAirport.airportName;
                              });
                            },
                            // value: _currentAirport,
                            hint: Text("Airport"),
                          );
                        }),

                       DropdownButton<String>(
                        onChanged: (String newVal) {
                          setState(() {
                            selectedHeading = newVal;

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
            Card(


              child: /* Icon(Icons.play_circle_filled,
              size: 100,
                  color: Colors.grey[700],
              ),

              */
              btnSection(),
              //onPressed: () {},
              //
            ),
          ],
        ),
      ),

    );
  }


}


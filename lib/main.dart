import 'package:flutter/material.dart';
import './CustomScreen.dart';

// TODO: Need to add drawer menu


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
    Widget build(BuildContext context) {
      return  MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'PilotVoice',
      theme: ThemeData(
        // This is the theme of your application.
       primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'PilotVoice'),

    );

    }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    Text('Index 0: Home'),
    CustomScreen(),
    Text('Index 2: Script'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Menu icon on Appbar
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        title: Text('PilotVoice'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.airplanemode_active), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.comment), title: Text('Custom')),
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('Script')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}

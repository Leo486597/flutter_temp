import 'package:flutter/material.dart';
// import 'package:awacs_leo/widgets/equipment_card.dart';
import 'package:awacs_leo/models/equipment.dart';
import 'package:awacs_leo/pages/equipment_list_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Equipment List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Equipment> initEquipments = []
    ..add(new Equipment('123', 'Location B', 10))
    ..add(new Equipment('234', 'Location C', 11))
    ..add(new Equipment('893', 'Location A', 12));

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new EquipmentListPage(initEquipments),
      ),
      // floatingActionButton: new FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: new Icon(Icons.add),
      // ),
    );
  }
}

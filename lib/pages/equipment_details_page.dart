import 'package:awacs_leo/models/equipment.dart';
import 'package:flutter/material.dart';

class EquipmentDetailsPage extends StatefulWidget {
  final Equipment equipment;

  EquipmentDetailsPage(this.equipment);

  @override
  _EquipmentDetailsPageState createState() =>
      _EquipmentDetailsPageState(equipment);
}

class _EquipmentDetailsPageState extends State<EquipmentDetailsPage> {
  Equipment equipment;

  _EquipmentDetailsPageState(this.equipment);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('PN: ${widget.equipment.pn} details'),
      ),
      body: equipmentDetails,
    );
  }

  Widget get equipmentDetails {
    return new Container(
      width: 400.0,
      height: 500.0,
      child: new Card(
        color: Colors.white10,
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: equipmentImg,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: new Text(
                  'PN: ${widget.equipment.pn}',
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
              new Text(
                'Designation: ${widget.equipment.designation}',
                style: Theme.of(context).textTheme.body2,
              ),
              new Text(
                'Location ID: ${widget.equipment.locationID}',
                style: Theme.of(context).textTheme.body2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get equipmentImg {
    double width = 320.0 - 20.0;
    return new Container(
      width: width,
      height: width,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(widget.equipment.imgUrl ?? ''),
        ),
      ),
    );
  }
}

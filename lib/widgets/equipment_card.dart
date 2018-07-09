import 'package:flutter/material.dart';
import 'package:awacs_leo/models/equipment.dart';
import 'package:awacs_leo/pages/equipment_details_page.dart';

class EquipmentCard extends StatefulWidget {
  final Equipment equipment;
  EquipmentCard(this.equipment);

  @override
  _EquipmentCardState createState() => _EquipmentCardState(equipment);
}

class _EquipmentCardState extends State<EquipmentCard> {
  Equipment equipment;

  _EquipmentCardState(this.equipment);

  String renderUrl;
  double cardWidth = 320.0;
  double cardHeight = 400.0;

  @override
  void initState() {
    super.initState();
    renderEquipmentImg();
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: showDetailsPage,
      child: equipmentCard,
    );
  }

  void renderEquipmentImg() async {
    await equipment.getImgUrl();
    setState(() {
      renderUrl = equipment.imgUrl;
    });
  }

  void showDetailsPage() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return new EquipmentDetailsPage(equipment);
        },
      ),
    );
  }

  Widget get equipmentCard {
    return new Container(
      width: cardWidth,
      height: cardHeight,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget get equipmentImg {
    double width = this.cardWidth - 20.0;
    return new Container(
      width: width,
      height: width,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: new NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }
}

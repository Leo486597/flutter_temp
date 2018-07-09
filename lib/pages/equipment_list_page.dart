import 'package:flutter/material.dart';
import 'package:awacs_leo/widgets/equipment_card.dart';
import 'package:awacs_leo/models/equipment.dart';

class EquipmentListPage extends StatelessWidget {
  final List<Equipment> equipments;

  EquipmentListPage(this.equipments);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: equipments.length,
      itemBuilder: (context, index) {
        return new EquipmentCard(equipments[index]);
      },
    );
  }
}

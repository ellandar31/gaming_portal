import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/commun/qwinto_circle.dart';
import 'package:gaming_portal/src/qwinto/commun/qwinto_pentagram.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_cell.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_enums.dart';


class Cellule extends StatelessWidget {
  const Cellule({ super.key, required this.qwintoCell,});

  final QwintoCell qwintoCell;

  @override
  Widget build(BuildContext context) {
    // Affiche un widget distinct selon la valeur de formCell
    switch(qwintoCell.getForm()){
      case QwintoForm.circle:
        return CircleCell(qwintoCell: qwintoCell,);        
      case QwintoForm.pentagone:
        return PentagonCell(qwintoCell: qwintoCell);
      default : 
        return const SizedBox(width: 40, height: 40,);
    }
  }
}

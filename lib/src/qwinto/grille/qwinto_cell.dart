import 'package:flutter/material.dart';

import '../commun/qwinto_circle.dart';
import '../commun/qwinto_pentagram.dart';

class Cellule extends StatelessWidget {
  const Cellule({
    super.key,
    required this.value,
    required this.formCell,
    required this.currentColor,
  });

  final int? value;
  final bool formCell;
  final Color currentColor;

  @override
  Widget build(BuildContext context) {
    // Affiche un widget distinct selon la valeur de formCell
    if (value != null && value! < 0){
      return Container(
      width: 40,
      height: 40, // Largeur et hauteur identiques pour former un cercle
      decoration: BoxDecoration(
        shape: BoxShape.rectangle, // Forme circulaire
        color: currentColor,
      ),
      
    );
    }
    return formCell
        ? PentagonCell(value: value) // Affiche le pentagone si formCell est vrai
        : CircleCell(value: value); // Affiche le cercle si formCell est faux
  }
}

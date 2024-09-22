import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';

class SquareCell extends StatelessWidget {
  const SquareCell({
    super.key,
    required this.value, 
    required this.color,
  });

  final int? value;
  final String color;

  @override
  Widget build(BuildContext context) {
    Color currentColor = 
        (color == QwintoState.red)? Colors.red :
        (color == QwintoState.yellow) ? const Color.fromARGB(255, 228, 207, 12) :
        (color == QwintoState.blue) ? Colors.purple :
            Colors.black; 

    return Container(
      width: 40,
      height: 40, // Largeur et hauteur identiques pour former un carré
      decoration: BoxDecoration(
        shape: BoxShape.rectangle, 
      border: Border.all(color: currentColor, width: 4),
        color: Colors.white, // Couleur du fond
      ),
      child: Center(
        child: Text(
          value?.toString() ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

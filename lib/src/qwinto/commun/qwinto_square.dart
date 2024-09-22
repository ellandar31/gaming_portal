import 'package:flutter/material.dart';

class SquareCell extends StatelessWidget {
  const SquareCell({
    super.key,
    required this.value,
  });

  final int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30, // Largeur et hauteur identiques pour former un carré
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle, 
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

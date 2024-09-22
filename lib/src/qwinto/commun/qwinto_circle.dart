import 'package:flutter/material.dart';

class CircleCell extends StatelessWidget {
  const CircleCell({
    super.key,
    required this.value,
  });

  final int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40, // Largeur et hauteur identiques pour former un cercle
      decoration: const BoxDecoration(
        shape: BoxShape.circle, // Forme circulaire
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

import 'dart:math';
import 'package:flutter/material.dart';

class PentagonCell extends StatelessWidget {
  const PentagonCell({
    super.key,
    required this.value,
  });

  final int? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40, // Taille fixe pour le pentagone
      child: CustomPaint(
        painter: PentagonPainter(), // Utilisation du PentagonPainter pour dessiner le pentagone
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
      ),
    );
  }
}

// Painter pour dessiner un pentagone
class PentagonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white; // Couleur du pentagone

    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;

    // Calculer les 5 points du pentagone
    for (int i = 0; i < 5; i++) {
      final angle = (pi / 2) + (i * 2 * pi / 5); // Angle pour chaque point
      final x = centerX + radius * cos(angle);
      final y = centerY - radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

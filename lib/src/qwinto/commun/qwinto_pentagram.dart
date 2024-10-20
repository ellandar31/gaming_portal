import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_cell.dart';

class PentagonCell extends StatelessWidget {
  const PentagonCell({
    super.key,required this.qwintoCell,    
  });

  final QwintoCell qwintoCell;

  @override
  Widget build(BuildContext context) {
    return SizedBox( width: 40, height: 40, 
      child: CustomPaint(
        painter: PentagonPainter(qwintoCell.isDisaballed() ? Colors.grey: Colors.white), // Utilisation du PentagonPainter pour dessiner le pentagone
        child: Center( child: Text(
            qwintoCell.getValue() > 0 ? qwintoCell.getValue().toString() : '',
            textAlign: TextAlign.center,
            style: const TextStyle( fontSize: 16, color: Colors.black,),
          ),
        ),
      ),
    );
  }
}

// Painter pour dessiner un pentagone
class PentagonPainter extends CustomPainter {
  final Color _fillColor;
  PentagonPainter(this._fillColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = _fillColor; // Couleur du pentagone

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

import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_cell.dart';

class CircleCell extends StatelessWidget {
  const CircleCell({
    super.key, required this.qwintoCell,    
  });

  final QwintoCell qwintoCell;

  @override
  Widget build(BuildContext context) {
    return Container( width: 40, height: 40, 
      decoration: const BoxDecoration( shape: BoxShape.circle, color: Colors.white, ),
      child: Center(
        child: Text(
          qwintoCell.getValue() > 0 ? qwintoCell.getValue().toString() : '',
          textAlign: TextAlign.center,
          style: const TextStyle( fontSize: 16, color: Colors.black ,),
        ),
      ),
    );
  }
}

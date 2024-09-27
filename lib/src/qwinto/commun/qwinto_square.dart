import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_cell.dart';

class SquareCell extends StatelessWidget {
  const SquareCell({
    super.key,required this.qwintoCell,    
  });

  final QwintoCell qwintoCell;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, height: 40, 
      decoration: BoxDecoration(
        shape: BoxShape.rectangle, color: Colors.white, 
        border: Border.all(color: qwintoCell.getColor(), width: 4),
      ),
      child: Center( child: Text(
          qwintoCell.getValue().toString(),
          textAlign: TextAlign.center,
          style: const TextStyle( fontSize: 16, color: Colors.black, ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/commun/qwinto_pentagram.dart';
import 'package:gaming_portal/src/qwinto/commun/qwinto_square.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class QwintoScoreBar extends StatelessWidget {
  const QwintoScoreBar({super.key});

  @override
  Widget build(BuildContext context) {
    var qwintoState = Provider.of<QwintoState>(context);
 
    return Container(
      color : Colors.grey,
      child: Row(        
        children: [
          SquareCell(value: qwintoState.lineScoreMap[QwintoState.red]),
          SquareCell(value: qwintoState.lineScoreMap[QwintoState.yellow]),
          SquareCell(value: qwintoState.lineScoreMap[QwintoState.blue]),
          const Text("+",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          PentagonCell(value: qwintoState.columns[2]!['score']),
          PentagonCell(value: qwintoState.columns[3]!['score']),
          PentagonCell(value: qwintoState.columns[7]!['score']),
          PentagonCell(value: qwintoState.columns[8]!['score']),
          PentagonCell(value: qwintoState.columns[9]!['score']),
          const Text("-",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SquareCell(value: qwintoState.scoreErreur),
          const Text("=",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          SquareCell(value: qwintoState.scoreTotal),
      
      ],),
    );
  }
}

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
          SquareCell(value: qwintoState.lineScoreMap[QwintoState.red], color : QwintoState.red,),
        const SizedBox(width: 10),
          SquareCell(value: qwintoState.lineScoreMap[QwintoState.yellow], color : QwintoState.yellow,),
        const SizedBox(width: 10),
          SquareCell(value: qwintoState.lineScoreMap[QwintoState.blue], color : QwintoState.blue,),
        const SizedBox(width: 10),
          const Text("+",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
          PentagonCell(value: qwintoState.columns[2]!['score']),
        const SizedBox(width: 10),
          PentagonCell(value: qwintoState.columns[3]!['score']),
        const SizedBox(width: 10),
          PentagonCell(value: qwintoState.columns[7]!['score']),
        const SizedBox(width: 10),
          PentagonCell(value: qwintoState.columns[8]!['score']),
        const SizedBox(width: 10),
          PentagonCell(value: qwintoState.columns[9]!['score']),
        const SizedBox(width: 10),
          const Text("-",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
          SquareCell(value: qwintoState.scoreErreur, color : 'black'),
        const SizedBox(width: 10),
          const Text("=",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
          SquareCell(value: qwintoState.scoreTotal, color : 'black'),
      
      ],),
    );
  }
}
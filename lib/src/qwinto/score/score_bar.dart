
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/commun/qwinto_pentagram.dart';
import 'package:gaming_portal/src/qwinto/commun/qwinto_square.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_enums.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_score.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class QwintoScoreBar extends StatelessWidget {
  const QwintoScoreBar({super.key});

  @override
  Widget build(BuildContext context) {
    var qwintoState = Provider.of<QwintoState>(context);
    QwintoScore score = qwintoState.score;
 
     return Row(        
       children: [
        SquareCell(qwintoCell: score.scoreRed,),
      const SizedBox(width: 10),
        SquareCell(qwintoCell: score.scoreYellow),
      const SizedBox(width: 10),
        SquareCell(qwintoCell: score.scorePurple),
      const SizedBox(width: 10),
        const Text("+",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      const SizedBox(width: 10),
        PentagonCell(qwintoCell: score.scoreCols[PentagonesCol.first]!),
      const SizedBox(width: 10),
        PentagonCell(qwintoCell: score.scoreCols[PentagonesCol.second]!),
      const SizedBox(width: 10),
        PentagonCell(qwintoCell: score.scoreCols[PentagonesCol.third]!),
      const SizedBox(width: 10),
        PentagonCell(qwintoCell: score.scoreCols[PentagonesCol.fourth]!),
      const SizedBox(width: 10),
        PentagonCell(qwintoCell: score.scoreCols[PentagonesCol.fifth]!),
       const SizedBox(width: 10),
         const Text("-",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      const SizedBox(width: 10),
        SquareCell(qwintoCell: score.scoreErr),
      const SizedBox(width: 10),
        const Text("=",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      const SizedBox(width: 10),
        SquareCell(qwintoCell: score.scoreTot),
    
    ],);
  }
}
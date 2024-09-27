
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_enums.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_errors.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_grid.dart';

import 'qwinto_cell.dart';

class QwintoScore {

  QwintoCell scoreRed = QwintoCell(value: 0, form: QwintoForm.square, color: Colors.red);
  QwintoCell scoreYellow = QwintoCell(value: 0, form: QwintoForm.square, color: Colors.yellow);
  QwintoCell scoreBlue = QwintoCell(value: 0, form: QwintoForm.square, color: Colors.purple);

  Map<PentagonesCol, QwintoCell> scoreCols = {
    PentagonesCol.first: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
    PentagonesCol.second: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
    PentagonesCol.third: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
    PentagonesCol.fourth: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
    PentagonesCol.fifth: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
  };
  
  QwintoCell scoreErr = QwintoCell(value: 0, form: QwintoForm.square, color: Colors.black);
  QwintoCell scoreTot = QwintoCell(value: 0, form: QwintoForm.square, color: Colors.black);

  QwintoScore();

  void reinit(){      
    scoreRed.setValue(0);
    scoreBlue.setValue(0);
    scoreYellow.setValue(0);

    scoreCols = {
      PentagonesCol.first: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
      PentagonesCol.second: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
      PentagonesCol.third: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
      PentagonesCol.fourth: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
      PentagonesCol.fifth: QwintoCell(value: 0, form: QwintoForm.pentagone, color: Colors.black),
    };
      
    scoreErr.setValue(0);
    scoreTot.setValue(0);
  }

  //met à jour les valeurs de scores 
  void updateScore(QwintoColorGrid grid, QwintoErros errors){
    int total = 0;

    //scores des lignes
    scoreRed.setValue(grid.redRow.getScore());
    scoreBlue.setValue(grid.blueRow.getScore());
    scoreYellow.setValue(grid.yellowRow.getScore());
    scoreErr.setValue(errors.getScore());
    total = scoreRed.getValue() + scoreBlue.getValue() + scoreYellow.getValue() - scoreErr.getValue();

    //scores des colonnes
    for(PentagonesCol key in scoreCols.keys){
      int val = grid.getColScore(key);
      scoreCols[key]!.setValue(val);
      total += val;
    }
    scoreTot.setValue(total);
  }

}

import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_errors.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_grid.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_row.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_score.dart';

class QwintoState extends ChangeNotifier {

  QwintoColorGrid grid = QwintoColorGrid();
  QwintoErros errors = QwintoErros();
  QwintoScore score = QwintoScore();


  late int? currentRoll;

  static const String red = "RED";
  static const String yellow = "YELLOW";
  static const String blue = "BLUE";

  bool endParty = false;

  QwintoState(){
    grid.reinit();
    errors.reinit();
    score.reinit();
 }

  void updateValue(int newValue) {
    currentRoll = newValue;
    notifyListeners(); // Notifie les widgets pour mettre à jour
  }

  void reinit(){
    grid.reinit();
    errors.reinit();
    score.reinit();
    notifyListeners();
  }

//----------------------------------------------
//     Lignes
//----------------------------------------------

 
  void updateRow(QwintoRow curRow, int position, int value) {
    curRow.setValue(position, value); 
    checkEndParty();
    updateScore(); 
  }

  void checkEndParty() {
    endParty = errors.isFilled() || grid.isFilled();
  }

  void updateScore() {
    score.updateScore(grid, errors);
    notifyListeners();  
  }

}

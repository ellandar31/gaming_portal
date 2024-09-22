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

  Map<int, Map<String, dynamic>> columns = {
    2: {'color': blue, 'score': 0},
    3: {'color': red, 'score': 0},
    7: {'color': red, 'score': 0},
    8: {'color': yellow, 'score': 0},
    9: {'color': blue, 'score': 0},
  };
  
  Map<String, List<int?>> colorMap = {
    red: List.filled(12, null),
    yellow: List.filled(12, null),
    blue: List.filled(12, null),
  };

  Map<String, int> lineScoreMap = {
    red: 0,
    yellow: 0,
    blue: 0,
  };

  List<int> colScores = List.filled(5, 0);  

  int scoreErreur = 0;
  int scoreTotal = 0;
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

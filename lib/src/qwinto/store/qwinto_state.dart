import 'package:flutter/material.dart';

class QwintoState extends ChangeNotifier {
  late int currentRoll;


  void updateValue(int newValue) {
    currentRoll = newValue;
    notifyListeners(); // Notifie les widgets pour mettre à jour
  }

  Map<int,String> columns = {
     2 : blue,
     3 : red,
     7 : red,
     8 : yellow,
     9 : blue,
  };

  QwintoState(){
    colorMap[red]![0] = -2;
    colorMap[red]![1] = -2;
    colorMap[red]![5] = -1;

    colorMap[yellow]![0] = -2;
    colorMap[yellow]![6] = -1;
    colorMap[yellow]![11] = -2;

    colorMap[blue]![4] = -1;
    colorMap[blue]![10] = -2;
    colorMap[blue]![11] = -2;
    errorList= [];
 }

  void reinit(){
    colorMap = {
      red: List.filled(12, null),
      yellow: List.filled(12, null),
      blue: List.filled(12, null),
    };

    colorMap[red]![0] = -2;
    colorMap[red]![1] = -2;
    colorMap[red]![5] = -1;

    colorMap[yellow]![0] = -2;
    colorMap[yellow]![6] = -1;
    colorMap[yellow]![11] = -2;

    colorMap[blue]![4] = -1;
    colorMap[blue]![10] = -2;
    colorMap[blue]![11] = -2;
    errorList= [];
    //calculateScore();
    notifyListeners();
  }

//----------------------------------------------
//     Lignes
//----------------------------------------------

  static const String red = "RED";
  static const String yellow = "YELLOW";
  static const String blue = "BLUE";

  Map<String, List<int?>> colorMap = {
    red: List.filled(12, null),
    yellow: List.filled(12, null),
    blue: List.filled(12, null),
  };


  int? getRowValue(String color, int position) {
     return colorMap[color]![position];
  }

  void updateRow(String color, int position, int value) {
     currentRoll = value;
     updateRowRoll(color, position);
  }

  void updateRowRoll(String color, int position) {
    colorMap[color]![position] = currentRoll;
    //checkEndParty();
    //calculateScore();
    notifyListeners();
  }

//----------------------------------------------
//     erreur
//----------------------------------------------

  late List<int?> errorList;

  void addToError() {
    errorList.add(5);
    checkEndParty();
    scoreErreur = errorList
        .where((value) => value != null)
        .fold(0, (previous, current) => previous + current!);
    updateScoreTotal();
    notifyListeners();
  }

//----------------------------------------------
//     fin de partie
//----------------------------------------------
  bool endParty = false;

  List<int?> getValuesNotNegativeOne(String color) {
    return colorMap[color]!.where((value) => value != null && value != -1).toList();
  }

  void checkEndParty() {
    if (errorList.length >= 4) {
      endParty = true;
    }
    //controles si deux lignes sont pleines
    // Création d'une liste avec les listes filtrées
    var purgedLists = [ 
      getValuesNotNegativeOne(red), 
      getValuesNotNegativeOne(yellow),
      getValuesNotNegativeOne(blue) ];

    // Vérification si au moins deux listes ont 9 éléments ou plus
    int fullRowCount = purgedLists.where((list) => list.length >= 9).length;

    if (fullRowCount >= 2) {
      endParty = true;
    }
  }

//----------------------------------------------
//     Score
//----------------------------------------------

  int scoreErreur = 0;
  int scoreTotal = 0;

  List<int> rowScores = List.filled(3, 0);  
  List<int> colScores = List.filled(5, 0);  

  void updateScoreTotal() {
    // Somme les scores des rangées et des colonnes, puis soustrait le score d'erreur
    scoreTotal = rowScores.reduce((a, b) => a + b) + colScores.reduce((a, b) => a + b) - scoreErreur;
  }

  void calculateScore() {
    // Calcul des scores des rangées
    rowScores[0] = calculateRowScore(red);
    rowScores[1] = calculateRowScore(yellow);
    rowScores[2] = calculateRowScore(blue);

    // Indices et couleurs pour les colonnes

    // Calcul des scores des colonnes
    for (int i = 0; i < columns.length; i++) {
      int key = columns.keys.elementAt(i);
      colScores[i] = calculateColumnBonus(key, columns[key]!);
    }

    updateScoreTotal();
  }


  int calculateColumnBonus(int position, String color) {
    // Vérifie si toutes les valeurs aux mêmes positions dans les trois listes ne sont pas null
    if (['blue', 'red', 'yellow'].every((c) => colorMap[c]![position] != null)) {
      // Retourne la valeur de la couleur donnée ou 0 si null
      return colorMap[color]![position] ?? 0;
    }
    return 0;
  }

  int calculateRowScore(String color) {
    var purgedRow = getValuesNotNegativeOne(color);
    // Si la ligne purgée contient 9 éléments ou plus, retourne le 9ème élément
    return purgedRow.length >= 9 ? purgedRow[8] ?? 0 : purgedRow.length;
  }

}

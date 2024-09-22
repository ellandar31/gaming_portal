import 'package:flutter/material.dart';

class QwintoState extends ChangeNotifier {
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
    colorMap[red]![0] = -2;
    colorMap[red]![1] = -2;
    colorMap[red]![5] = -1;

    colorMap[yellow]![0] = -2;
    colorMap[yellow]![6] = -1;
    colorMap[yellow]![11] = -2;

    colorMap[blue]![4] = -1;
    colorMap[blue]![10] = -2;
    colorMap[blue]![11] = -2;
    errorList= [0,0,0,0];
    lineScoreMap = {red: 0,yellow: 0,blue: 0,};
    columns = {
      2: {'color': blue, 'score': 0},
      3: {'color': red, 'score': 0},
      7: {'color': red, 'score': 0},
      8: {'color': yellow, 'score': 0},
      9: {'color': blue, 'score': 0},
    };
 }

  void updateValue(int newValue) {
    currentRoll = newValue;
    notifyListeners(); // Notifie les widgets pour mettre à jour
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
    errorList= [0,0,0,0];
  
    columns = {
      2: {'color': blue, 'score': 0},
      3: {'color': red, 'score': 0},
      7: {'color': red, 'score': 0},
      8: {'color': yellow, 'score': 0},
      9: {'color': blue, 'score': 0},
    };
    
    lineScoreMap = {red: 0,yellow: 0,blue: 0,};
    scoreErreur = 0;
    scoreTotal = 0;  

    notifyListeners();
  }

//----------------------------------------------
//     Lignes
//----------------------------------------------

  int? getRowValue(String color, int position) {
     return colorMap[color]![position];
  }

  void updateRow(String color, int position, int? value) {
     currentRoll = value;
     updateRowRoll(color, position);
  }

  void updateRowRoll(String color, int position) {
    colorMap[color]![position] = currentRoll;
    checkEndParty();
    calculateRowScore(color);    
    calculateColumnBonus(position);
    updateScoreTotal();
    notifyListeners();
  }

  void calculateRowScore(String color) {
    var purgedRow = getValuesNotNegativeOne(color);
    // Si la ligne purgée contient 9 éléments ou plus, retourne le 9ème élément
    lineScoreMap[color] = purgedRow.length >= 9 ? purgedRow[8] ?? 0 : purgedRow.length;
  }

//----------------------------------------------
//     erreur
//----------------------------------------------

  late List<int?> errorList;

  void addToError(bool checked, int index) {
    errorList[index] = checked ? 5 : 0;
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

  List<int?> getValuesNotNegativeOne(String color) {
    return colorMap[color]!.where((value) => value != null && value > 0).toList();
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

  void updateScoreTotal() {
    // Somme les scores des rangées et des colonnes, puis soustrait le score d'erreur
    
    // Calculer la somme des scores
    int? totalColScore = 0;
    columns.forEach((key, value) {totalColScore = (totalColScore! + value['score']!) as int?;});

    scoreTotal = lineScoreMap[red]! + lineScoreMap[yellow]! + lineScoreMap[blue]! + totalColScore! - scoreErreur;
  }

  void calculateColumnBonus(int position) {
    // Vérifie si toutes les valeurs aux mêmes positions dans les trois listes ne sont pas null
    
    if(columns.containsKey(position)){
      if(colorMap[red]![position] != null && 
         colorMap[yellow]![position] != null &&
         colorMap[blue]![position] != null)
      {
        // Retourne la valeur de la couleur donnée ou 0 si null
        String couleur = columns[position]!['color'];
        columns[position]!['score'] = colorMap[couleur]![position] ?? 0; 
      }
    }
  }
}

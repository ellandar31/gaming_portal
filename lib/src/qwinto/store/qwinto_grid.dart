import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_enums.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_row.dart';

class QwintoColorGrid {

  final QwintoRow redRow= QwintoRow(color: QwintoColor.red);
  final QwintoRow yellowRow= QwintoRow(color: QwintoColor.yellow);
  final QwintoRow purpleRow= QwintoRow(color: QwintoColor.purple);

  QwintoColorGrid();

  /// reinitialise la grille 
  void reinit(){
    redRow.initList();
    yellowRow.initList();
    purpleRow.initList();
  }

  /// calcul tu score par colonnes avec des pentagones
  int getColScore(PentagonesCol column){
    int col = column.getColumn();

    if (redRow.getValue(col) > 0 && purpleRow.getValue(col) > 0 && yellowRow.getValue(col) > 0)
    {
      switch(column.getColor()){
        case QwintoColor.red:
          return redRow.getValue(col);
        case QwintoColor.yellow:
          return yellowRow.getValue(col);
        case QwintoColor.purple:
          return purpleRow.getValue(col);
      }
    }
    return 0;
  }

  /// retourne true si la valeur n'est pas déjà utilisé dans la colonne
  bool checkColumn(int col, QwintoColor color, int value){
    switch(color){
      case QwintoColor.red:
        return (purpleRow.getValue(col) != value && yellowRow.getValue(col) != value);
      case QwintoColor.yellow:
        return (purpleRow.getValue(col) != value && redRow.getValue(col) != value);
      case QwintoColor.purple:
        return (redRow.getValue(col) != value && yellowRow.getValue(col) != value);
    }
  }

  /// Affiche les cases non disponible en gris si la valeur ne peut pas être utilisée
  void preFilled(List<Color> colors, int currentRoll){
    //chaque couleur n'est présente qu'une fois
    //reinitialisation des Row  (appel à preFilled avec 0)
    redRow.preFilled(0);
    yellowRow.preFilled(0);
    purpleRow.preFilled(0);
    if (!colors.contains(Colors.red)) redRow.preFilled(20);
    if (!colors.contains(Colors.yellow)) yellowRow.preFilled(20);
    if (!colors.contains(Colors.purple)) purpleRow.preFilled(20);
    // pour toutes les couleurs dans la liste appel à preFilled 
    for(int index=0; index < colors.length; index ++ ){
      switch(colors[index]){
        case Colors.red : redRow.preFilled(currentRoll); break;
        case Colors.yellow : yellowRow.preFilled(currentRoll); break;
        case Colors.purple : purpleRow.preFilled(currentRoll); break;  
      }
    }
  }
  
  /// vérifie si au moins deux lignes sont remplies 
  bool isFilled(){
    bool redFilled = redRow.isFilled();
    bool yellowFilled = yellowRow.isFilled();
    bool purpleFilled = purpleRow.isFilled();
    return (redFilled && yellowFilled)||(purpleFilled && yellowFilled)||(redFilled && purpleFilled);
  }

}

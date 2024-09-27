import 'package:gaming_portal/src/qwinto/store/qwinto_enums.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_row.dart';

class QwintoColorGrid {

  final QwintoRow redRow= QwintoRow(color: QwintoColor.red);
  final QwintoRow yellowRow= QwintoRow(color: QwintoColor.yellow);
  final QwintoRow blueRow= QwintoRow(color: QwintoColor.blue);

  QwintoColorGrid();

  //reinitialise la grille 
  void reinit(){
    redRow.initList();
    yellowRow.initList();
    blueRow.initList();
  }

  //calcul tu score par colonnes avec des pentagones
  int getColScore(PentagonesCol column){
    int col = column.getColumn();

    if (redRow.getValue(col) > 0 && blueRow.getValue(col) > 0 && yellowRow.getValue(col) > 0)
    {
      switch(column.getColor()){
        case QwintoColor.red:
          return redRow.getValue(col);
        case QwintoColor.yellow:
          return yellowRow.getValue(col);
        case QwintoColor.blue:
          return blueRow.getValue(col);
      }
    }
    return 0;
  }

  // retourne true si la valeur n'est pas déjà utilisé dans la colonne
  bool checkColumn(int col, QwintoColor color, int value){
    switch(color){
      case QwintoColor.red:
        return (blueRow.getValue(col) != value && yellowRow.getValue(col) != value);
      case QwintoColor.yellow:
        return (blueRow.getValue(col) != value && redRow.getValue(col) != value);
      case QwintoColor.blue:
        return (redRow.getValue(col) != value && yellowRow.getValue(col) != value);
    }
  }

  //vérifie si au moins deux lignes sont remplies 
  bool isFilled(){
    bool redFilled = redRow.isFilled();
    bool yellowFilled = yellowRow.isFilled();
    bool blueFilled = blueRow.isFilled();
    return (redFilled && yellowFilled)||(blueFilled && yellowFilled)||(redFilled && blueFilled);
  }

}

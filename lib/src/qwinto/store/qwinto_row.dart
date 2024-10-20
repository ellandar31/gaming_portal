import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_cell.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_enums.dart';

class QwintoRow {

  final List<QwintoCell> _cells =[];
  late final QwintoColor _color;

  QwintoRow({required QwintoColor color}){      
        _color = color;
        initList();
  }

  void initList(){
    _cells.clear();
    _cells.add(QwintoCell( form : _color == QwintoColor.purple ? QwintoForm.circle : QwintoForm.empty, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red  ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.purple ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.purple ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.yellow ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.yellow ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.purple ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.purple ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red ? QwintoForm.circle : QwintoForm.empty, value: 0, color: Colors.black));

  }

  void setValue(int position, int value){
    _cells[position].setValue(value);
  }

  int getValue(int position){
    return _cells[position].getValue();
  }

  QwintoCell getCell(int position){
    return _cells[position];
  }

  QwintoColor getColor(){
    return _color;
  }

  int getScore(){ 
    //récupération uniquement les cellules qui ne sont pas empty et dont la valeur est supérieur à 0 
    List<int> purgedRow = _cells.where((value) => value.getForm() != QwintoForm.empty && value.getValue() > 0).map((cell) => cell.getValue()).toList();
    // Si la ligne purgée contient 9 éléments ou plus, retourne le 9ème élément
    return  purgedRow.length >= 9 ? purgedRow[8] : purgedRow.length;
  }

  bool checkRow(int position, int value){   
    //transformation de la liste de cells pour récupérer uniquement les int qui sont saisis
    List<int> purgedRowInt = _cells.where((cell) => cell.getForm() != QwintoForm.empty && cell.getValue() > 0).map((cell) => cell.getValue()).toList();
    //test si la valeur est déjà présente
    if(purgedRowInt.contains(value)){
      return false;
    }
    //copie de la ligne pour setter la nouvelle valeur
    List<QwintoCell> copiedCells = List.from(_cells);
    copiedCells[position].setValue(value);
    //purge pour enlever les cellules vides
    List<int> purgedRow = _cells.where((value) => value.getForm() != QwintoForm.empty && value.getValue() > 0).map((cell) => cell.getValue()).toList();
    //test si toutes les valeurs sont dans l'ordre croissant 
    for (int i = 0; i < purgedRow.length - 1; i++) {
      if (purgedRow[i] > purgedRow[i + 1]) {
        return false; // La liste n'est pas triée
      }
    }
    return true; // La liste est triée
  }

  bool isFilled(){
    List<int> purgedRow = _cells.where((value) => value.getForm() != QwintoForm.empty && value.getValue() > 0).map((cell) => cell.getValue()).toList();
    return purgedRow.length >= 9;
  }
  
  void preFilled(int currentRoll) {
    if (currentRoll == 0) {
      // Si la valeur courante est 0, on désactive les cellules déjà remplies
      for (int index = 0; index < _cells.length; index++) {
        _cells[index].setDisabelled(_cells[index].getValue() > 0);
      }
    } else {
      // Pour les cellules avant la première occurrence d'une valeur supérieure à currentRoll
      int? resultMax = getClosestHigherIndex(currentRoll)?? _cells.length + 1;
      int? resultMin = getClosestLowerIndex(currentRoll)?? - 1;
      for(int index = 0;index < _cells.length; index++){
        if(!_cells[index].isDisaballed() && _cells[index].getForm() != QwintoForm.empty){
          _cells[index].setDisabelled(index <= resultMin || index >= resultMax);          
        }
      }    
      
    }
  }

  int? getClosestLowerIndex(int currentRoll) {
    int? closestIndex;
    int? closestValue;

    for (int index = 0; index < _cells.length; index++) {
      int cellValue = _cells[index].getValue();
      
      // Vérifier que la cellule a une valeur valide et inférieure à currentRoll
      if (cellValue > 0 && cellValue < currentRoll) {
        // Si c'est la première valeur trouvée ou si la valeur est plus proche de currentRoll
        if (closestValue == null || (currentRoll - cellValue) < (currentRoll - closestValue)) {
          closestValue = cellValue;
          closestIndex = index;
        }
      }
    }
    
    return closestIndex; // Retourner l'index de la valeur la plus proche, ou null si aucune valeur ne correspond
  }

  
  int? getClosestHigherIndex(int currentRoll) {
    int? closestIndex;
    int? closestValue;

    for (int index = 0; index < _cells.length; index++) {
      int cellValue = _cells[index].getValue();
      
      // Vérifier que la cellule a une valeur valide et inférieure à currentRoll
      if (cellValue > 0 && cellValue > currentRoll) {
        // Si c'est la première valeur trouvée ou si la valeur est plus proche de currentRoll
        if (closestValue == null || (cellValue - currentRoll) < (closestValue - currentRoll)) {
          closestValue = cellValue;
          closestIndex = index;
        }
      }
    }
    
    return closestIndex; // Retourner l'index de la valeur la plus proche, ou null si aucune valeur ne correspond
  }

}

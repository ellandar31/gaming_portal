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

    _cells.add(QwintoCell( form : _color == QwintoColor.blue ? QwintoForm.circle : QwintoForm.empty, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red  ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.blue ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.blue ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.yellow ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.red ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.yellow ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.blue ? QwintoForm.pentagone : QwintoForm.circle, value: 0, color: Colors.black));
    _cells.add(QwintoCell( form : _color == QwintoColor.blue ? QwintoForm.empty : QwintoForm.circle, value: 0, color: Colors.black));
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

  Color getColor(){
    return _color.getValue();
  }

  int getScore(){ 
    //récupération uniquement les cellules qui ne sont pas empty et dont la valeur est supérieur à 0 
    List<int> purgedRow = _cells.where((value) => value.getForm() != QwintoForm.empty && value.getValue() > 0).map((cell) => cell.getValue()).toList();
    // Si la ligne purgée contient 9 éléments ou plus, retourne le 9ème élément
    return  purgedRow.length >= 9 ? purgedRow[8] : purgedRow.length;
  }

  bool checkRow(int position, int value){   
    List<QwintoCell> copiedCells = List.from(_cells);
    copiedCells[position].setValue(value);
    List<int> purgedRow = _cells.where((value) => value.getForm() != QwintoForm.empty && value.getValue() > 0).map((cell) => cell.getValue()).toList();
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
}

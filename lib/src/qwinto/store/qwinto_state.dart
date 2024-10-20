import 'package:flutter/material.dart';
import 'package:flutter_dice/dice_package.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_errors.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_grid.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_row.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_score.dart';
import 'package:get/get.dart';

class QwintoState extends ChangeNotifier {

  QwintoColorGrid grid = QwintoColorGrid();
  QwintoErros errors = QwintoErros();
  QwintoScore score = QwintoScore();


  late int? currentRoll;

  static const String red = "RED";
  static const String yellow = "YELLOW";
  static const String purple = "PURPLE";

  bool endParty = false;
  int scoreTotalValeur = 0;

  QwintoState(){
    grid.reinit();
    errors.reinit();
    score.reinit();

  }

  void updateValue(List<DiceResult> diceResult) {
    if(diceResult.isEmpty){
      return;
    }
    List<int> purgedDiceValues = diceResult.map((dice) => dice.number).toList();    
    // Si la liste n'est pas vide, on calcule la somme des valeurs, sinon currentRoll reste null ou 0
    currentRoll = purgedDiceValues.isNotEmpty 
        ? purgedDiceValues.reduce((value, element) => value + element) 
        : 0;

    //mise à jour de la grille 
    grid.preFilled(diceResult.map((dice) => dice.curColor).toList(),currentRoll!);
    notifyListeners(); // Notifie les widgets pour mettre à jour      
  }

  void reinit(){
    endParty = false;
    grid.reinit();
    errors.reinit();
    score.reinit();
    currentRoll = null;
    notifyListeners();
  }

//----------------------------------------------
//     Lignes
//----------------------------------------------

 
  void updateRow(QwintoRow curRow, int position, int value) {
    if(grid.checkColumn(position, curRow.getColor(), value) && curRow.checkRow(position, value)){
      curRow.setValue(position, value); 
      checkEndParty();
      updateScore(); 
    }
    else{
       Get.snackbar(
              'Erreur', // Titre de la Snackbar
              'Impossible de mettre cette valeur ici, \nrejouez ailleurs ou rentrez une erreur.', // Contenu de la Snackbar
              duration: const Duration(seconds: 5), // Durée de la Snackbar
              snackPosition: SnackPosition.BOTTOM, // Position de la Snackbar
              backgroundColor: Colors.red, // Couleur de fond
              colorText: Colors.white, // Couleur du texte
              borderRadius: 10, // Arrondi des coins
              margin: const EdgeInsets.all(10), // Marge
              animationDuration: const Duration(milliseconds: 300), // Durée de l'animation
              isDismissible: true, // Permet à l'utilisateur de fermer la Snackbar
              dismissDirection: DismissDirection.horizontal, // Direction de suppression
            );
    }
  }

  void checkEndParty() {
    endParty = errors.isFilled() || grid.isFilled();
    if(endParty){
      notifyListeners();
    }
  }

  void updateScore() {
    scoreTotalValeur = score.updateScore(grid, errors);
    notifyListeners();  
  }


}

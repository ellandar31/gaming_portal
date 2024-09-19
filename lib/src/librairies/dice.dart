import 'dart:math';

import 'package:flutter/material.dart';

class Dice {

  final int numberOfFaces;
  final Color color;

  Dice({required this.numberOfFaces, required this.color}){
    // Vérifie que le nombre de faces est valide
    if (numberOfFaces < 1) {
      throw ArgumentError('Le nombre de faces doit être supérieur ou égal à 1.');
    }
  }
  
  int rollDice() {
    // Génère un nombre aléatoire entre 1 et le nombre de faces (inclus)
    return Random().nextInt(numberOfFaces) + 1;
  }

}
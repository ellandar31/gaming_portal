import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:gaming_portal/src/qwinto/grille/qwinto_row.dart';


class QwintoGrid extends StatelessWidget {
  const QwintoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(          
            color: Colors.grey,
            child: getGrid(), // Remplacez par le widget que vous souhaitez rotates
        )
    );
  }

  Column getGrid(){
    return const Column(
      children: [
        // Affiche la Row pour la couleur rouge
        ColorRowWidget(color: QwintoState.red),
        SizedBox(height: 16),
        // Affiche la Row pour la couleur jaune
        ColorRowWidget(color: QwintoState.yellow),
        SizedBox(height: 16),
        // Affiche la Row pour la couleur bleue
        ColorRowWidget(color: QwintoState.blue),
      ],
    );
  }
}

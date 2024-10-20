import 'package:flutter/material.dart';
import 'package:flutter_dice/dice_package.dart';
import 'package:gaming_portal/src/qwinto/grille/qwinto_row.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


class QwintoGrid extends StatelessWidget {
  const QwintoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final DiceController diceController = Get.find<DiceController>(); // Obtenez le DiceController via GetX

    var qwintoState = Provider.of<QwintoState>(context);
    return Obx(() {
      qwintoState.updateValue(diceController.getResult()); 
      return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Affiche la Row pour la couleur rouge
              ColorRowWidget(curRow: qwintoState.grid.redRow,),
              const SizedBox(height: 16),
              // Affiche la Row pour la couleur jaune
              ColorRowWidget(curRow: qwintoState.grid.yellowRow,),
              const SizedBox(height: 16),
              // Affiche la Row pour la couleur bleue
              ColorRowWidget(curRow: qwintoState.grid.purpleRow,),
            ],
          ),
      );
    });
  }
}

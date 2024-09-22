import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/grille/qwinto_row.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';


class QwintoGrid extends StatelessWidget {
  const QwintoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    var qwintoState = Provider.of<QwintoState>(context);

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
            ColorRowWidget(curRow: qwintoState.grid.blueRow,),
          ],
        ),
    );
  }
}

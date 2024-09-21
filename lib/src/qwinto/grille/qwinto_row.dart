import 'package:flutter/material.dart';

import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:gaming_portal/src/qwinto/grille/qwinto_cell.dart';
import 'package:provider/provider.dart';

class ColorRowWidget extends StatelessWidget {
  final String color;

  const ColorRowWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    Color currentColor = (color == QwintoState.red)
        ? Colors.red
        : (color == QwintoState.yellow)
            ? const Color.fromARGB(255, 228, 207, 12)
            : Colors.purple; // Default to purple for 'blue'

    var qwintoState = Provider.of<QwintoState>(context);
    List<int?> values = qwintoState.colorMap[color]!;
    Map<int, String> columnBonus = qwintoState.columns;

    return Container(
      color: currentColor,
      child:  Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: getCellList(values, context, qwintoState, currentColor, columnBonus),
              )                
    );
  }
  
  List<Widget> getCellList(List<int?> values,BuildContext context, QwintoState qwintoState, Color currentColor, Map<int, String> columnBonus){
    return  List.generate(
      values.length,
      (index) {
        // Création des Text pour chaque valeur dans la liste
        return GestureDetector(
            onTap: () {
              // Lorsque la cellule est cliquée, met à jour l'état
              _showInputDialog(context, qwintoState, color, index);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Cellule(
                value: values[index],
                currentColor: currentColor,
                formCell: columnBonus.containsKey(index) ? columnBonus[index] == color : false,
              ),
            ));
      }
    );
  }

    // Fonction pour afficher un popup avec un champ de saisie
  void _showInputDialog(BuildContext context, QwintoState qwintoState, String color, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DropdownButtonFormField<int>(
                value: qwintoState.getRowValue(color, index) ?? 1, // Valeur initiale (1 par défaut)
                onChanged: (int? newValue) {
                  if (newValue != null) {
                    qwintoState.updateRow(color, index, newValue);
                    Navigator.of(context).pop(); // Ferme la boîte de dialogue
                  }
                },
                items: List<DropdownMenuItem<int>>.generate(
                  18, 
                  (int index) => DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text((index + 1).toString()),
                  ),
                ),
          ),
           actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Annuler'),
            ),]
        );
      }
    );
  }
}

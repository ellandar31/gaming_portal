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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
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
                    formCell: columnBonus.containsKey(index)
                        ? columnBonus[index] == color
                        : false,
                  ),
                ));
          },
        ),
      ),
    );
  }

    // Fonction pour afficher un popup avec un champ de saisie
  void _showInputDialog(BuildContext context, QwintoState qwintoState, String color, int index) {
    final _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Entrer une valeur'),
          content: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: 'Entrez un nombre entier'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer une valeur';
              }
              if (int.tryParse(value) == null) {
                return 'Veuillez entrer un nombre entier';
              }
              return null;
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                final int? inputValue = int.tryParse(_controller.text);
                if (inputValue != null) {
                  qwintoState.updateRow(color, index, inputValue); // Met à jour l'état avec la valeur
                  Navigator.of(context).pop(); // Ferme la boîte de dialogue après validation
                }
              },
              child: const Text('Valider'),
            ),
          ],
        );
      },
    );
  }
}

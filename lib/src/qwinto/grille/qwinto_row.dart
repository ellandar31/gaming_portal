import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/grille/qwinto_cell.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_row.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class ColorRowWidget extends StatelessWidget {
  final QwintoRow curRow;

  const ColorRowWidget({super.key, required this.curRow});

  @override
  Widget build(BuildContext context) {
    var qwintoState = Provider.of<QwintoState>(context);
    return Container(
      color: curRow.getColor(),
      child:  Row (
                mainAxisAlignment: MainAxisAlignment.center,
                children: getCellList(context,qwintoState),
              )
    );
  }
  
  List<Widget> getCellList(BuildContext context,QwintoState qwintoState){
    return  List.generate( 12, (index) {
        // Création des Text pour chaque valeur dans la liste
        return GestureDetector(
            onTap: () {
              // Lorsque la cellule est cliquée, met à jour l'état
              _showInputDialog(context, index,qwintoState);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Cellule( qwintoCell: curRow.getCell(index)),
            ));
      }
    );
  }

    // Fonction pour afficher un popup avec un champ de saisie
  void _showInputDialog(BuildContext context, int index,QwintoState qwintoState) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: DropdownButtonFormField<int>(
                value: curRow.getValue(index) > 0 ? curRow.getValue(index) : 1, 
                onChanged: (int? newValue) {if (newValue != null) {qwintoState.updateRow(curRow, index, newValue); Navigator.of(context).pop(); }},
                items: List<DropdownMenuItem<int>>.generate(18, (int index) => DropdownMenuItem<int>(value: index +1 ,child: Text((index +1).toString()),),),
          ),
           actions: <Widget>[
            TextButton( onPressed: () { curRow.setValue(index, 0);Navigator.of(context).pop(); }, child: const Text('Vider'), ),
            TextButton(onPressed: () {Navigator.of(context).pop(); },child: const Text('Annuler'),),
            ]
        );
      }
    );
  }
}

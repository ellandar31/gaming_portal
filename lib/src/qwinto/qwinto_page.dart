
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/errorScore/error_column.dart';
import 'package:gaming_portal/src/qwinto/grille/qwinto_grille.dart';
import 'package:gaming_portal/src/qwinto/score/score_bar.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class QwintoPage extends StatelessWidget {
  const QwintoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      children:[ 
        SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: getContent(),
          ),      
        ),
        const GameDialog(), 
      ]
    );
  }

  Widget getContent() {
    return const Column(
      children :
      [
        Row(
          children: [
            QwintoGrid(),
            ErrorCheckWidget(),
          ],
        ),
        QwintoScoreBar(),
      ]
    );
  }
}


class GameDialog extends StatelessWidget {
  const GameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QwintoState>(
      builder: (context, qwintoState, child) {
        if (qwintoState.endParty) {
          int total = qwintoState.scoreTotalValeur;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Fin de la Partie"),
                  content: Text("La partie est terminée !\nTotal : $total points"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        qwintoState.reinit();
                      },
                      child: const Text("OK"),
                    ),
                  ],
                );
              },
            );
          });
        }
        return Container(); // Vous pouvez afficher un widget ici si nécessaire
      },
    );
  }
}


  

import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/errorScore/error_column.dart';
import 'package:gaming_portal/src/qwinto/grille/qwinto_grille.dart';
import 'package:gaming_portal/src/qwinto/score/score_bar.dart';

class QwintoPage extends StatelessWidget {
  const QwintoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: getContent(),
      ),      
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
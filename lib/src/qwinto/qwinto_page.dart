
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/grille/grille.dart';

class QwintoPage extends StatelessWidget {
  const QwintoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: QwintoGrid(),
        ),
    );
  }
      

}
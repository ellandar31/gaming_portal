
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/grille/grille.dart';
import 'package:provider/provider.dart';

import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';

class QwintoPage extends StatelessWidget {
  const QwintoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => QwintoState(),
      child: const QwintoGrid(),
    );
  }
      

}
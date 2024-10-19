import 'package:flutter/material.dart';
import 'package:flutter_dice/dice_package.dart';
import 'package:gaming_portal/src/qwinto/qwinto_page.dart';
import 'package:gaming_portal/src/qwinto/refresh_button.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

import '../guard/profile_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
     List<Color> diceColors = [
      Colors.red,
      Colors.yellow,
      Colors.purple,
    ];
    return ChangeNotifierProvider(
        create: (context) => QwintoState(),
        child: Scaffold(
        appBar: AppBar(
          title: const Text('Qwinto App v6'), // Barre en haut
              backgroundColor: Colors.blue, // Couleur de la barre
          actions: [
            //TODO add your actions here 
            const DicesResult(), // Affichage des résultats
            const SizedBox(width: 20,),
            ModalDiceLauncher(diceColors: diceColors), // Widget modifié pour GetX        
            const SizedBox(width: 10,),
            const RefreshButton(),
            //ProfileButton(),
          ],
          automaticallyImplyLeading: false,
        ),
        body: const QwintoPage(),
      )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dice/dice_package.dart';
import 'package:gaming_portal/src/qwinto/qwinto_page.dart';
import 'package:gaming_portal/src/qwinto/refresh_button.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> diceColors = [Colors.red,Colors.yellow,Colors.purple,];

    final mediaQuery = MediaQuery.of(context);
    final isWideScreen = mediaQuery.size.width < mediaQuery.size.height;

    return ChangeNotifierProvider(
        create: (context) => QwintoState(),
        child: RotatedBox(
          quarterTurns: isWideScreen ? 3 : 0,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Qwinto App v7'), // Barre en haut
              backgroundColor: Colors.blue, // Couleur de la barre
              actions: [
                const DicesResult(), // Affichage des résultats des dés
                const SizedBox(width: 20,),
                ModalDiceLauncher(diceColors: diceColors),        
                const SizedBox(width: 10,),
                const RefreshButton(),
              ],
              automaticallyImplyLeading: true,
            ),
            body: const QwintoPage(),
                ),
        )
    );
  }
}

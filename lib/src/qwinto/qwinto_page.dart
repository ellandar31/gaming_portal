
import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/grille/grille.dart';
import 'package:gaming_portal/src/qwinto/menus/bottom_bar.dart';
import 'package:provider/provider.dart';

import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';

class QwintoPage extends StatelessWidget {
  const QwintoPage({super.key});

  @override
  Widget build(BuildContext context) {

      return ChangeNotifierProvider(
        create: (context) => QwintoState(),
        child: MaterialApp(
          title: 'Qwinto',
          color: Colors.grey,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 94, 97, 240)),
          ),
          home: Scaffold(
          appBar: topBarNav(),
          body: const QwintoGrid(), // Le contenu principal
          bottomNavigationBar: QwintoBottomAppBar(),
        ),
      ),
    );
  }
      
  AppBar topBarNav(){
    return AppBar(
            title: const Text('Qwinto App'), // Barre en haut
            backgroundColor: Colors.blue, // Couleur de la barre
          );
  }


}
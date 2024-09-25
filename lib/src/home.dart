import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/qwinto_page.dart';
import 'package:gaming_portal/src/qwinto/refresh_button.dart';
import 'package:gaming_portal/src/qwinto/store/qwinto_state.dart';
import 'package:provider/provider.dart';

import '../guard/profile_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QwintoState(),
        child: Scaffold(
        appBar: AppBar(
          title: const Text('Qwinto App v4'), // Barre en haut
              backgroundColor: Colors.blue, // Couleur de la barre
          actions: const [
            //TODO add your actions here 
            RefreshButton(),
            ProfileButton(),
          ],
          automaticallyImplyLeading: false,
        ),
        body: const QwintoPage(),
      )
    );
  }
}

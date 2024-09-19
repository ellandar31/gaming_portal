import 'package:flutter/material.dart';
import 'package:gaming_portal/src/qwinto/qwinto_page.dart';

import '../guard/profile_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          //TODO add your actions here 
          ProfileButton(),
        ],
        automaticallyImplyLeading: false,
      ),
      body: const QwintoPage(),
    );
  }
}

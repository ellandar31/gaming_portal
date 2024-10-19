import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dice/dice_package.dart';
import 'package:gaming_portal/firebase/firebase_options.dart';
import 'package:gaming_portal/src/home.dart';
import 'package:get/get.dart';

import 'guard/auth_gate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DiceController());//obligatoire pour initialiser le controller
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then( (_){
      runApp(const MyApp());
    }
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Qwinto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor : Colors.grey,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: 
          Center(
            child: ElevatedButton(onPressed: (){
              Get.to( () => const HomeScreen());
            }, 
              child: 
                const Text("Ouvrir la page Qwinto")),
          ), 
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokemon/screens/cadastro_screen.dart';
import 'package:pokemon/screens/login_screen.dart';
import 'package:pokemon/screens/pokemon_screen.dart';
import 'package:pokemon/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        CadastroScreen.id: (context) => const CadastroScreen(),
        PokemonScreen.id: (context) => const PokemonScreen()
      }
    );
  }
}

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokemon/screens/login_screen.dart';
import 'package:pokemon/screens/model/pokemon_model.dart';
import 'package:pokemon/screens/splash_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class PokemonScreen extends StatefulWidget {
  static const String id = 'pokemon_screen';

  const PokemonScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  var pokemonList = <Pokemon>[];

  @override
  void initState() {
    super.initState();
    HttpOverrides.global = MyHttpOverrides();
    fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Text('Sair'),
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logout feito com sucesso.'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pushReplacementNamed(context, LoginScreen.id);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: pokemonList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (_, index) {
            final pokemon = pokemonList[index];
            return Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(16),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void fetchPokemon() async {
    try {
      final uri = Uri.parse('https://pokeapi.co/api/v2/pokemon');
      final response = await Client().get(uri);

      final responseJson = jsonDecode(response.body);

      pokemonList = responseJson['results']
          .map<Pokemon>((jsonPokemon) => Pokemon(name: jsonPokemon['name']))
          .toList();

      setState(() {});
    } catch (error) {
      print(error);
    }
  }
}

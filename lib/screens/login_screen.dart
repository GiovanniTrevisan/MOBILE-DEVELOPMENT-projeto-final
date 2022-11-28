import 'package:flutter/material.dart';

import 'package:pokemon/screens/pokemon_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration( label: Text('Email'),
                  // hintText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                  // hintText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                elevation: 4,
                child: InkWell(
                    child: ListTile(
                  title: Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                      onTap: (){
                    Navigator.pushNamed(
                        context,
                        PokemonScreen.id,);
                      },
                )),

              )
            ],
          ),
        ),
      ),
    );
  }
}

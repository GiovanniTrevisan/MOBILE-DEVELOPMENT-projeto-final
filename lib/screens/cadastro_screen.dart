import 'package:flutter/material.dart';

class CadastroScreen extends StatelessWidget {
  static const String id = 'cadastro_screen';

  const CadastroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cadastro',
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                decoration: const InputDecoration(
                  label: Text('Nome Completo'),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Senha'),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  label: Text('Confirmar Senha'),
                ),
              ),
              SizedBox(height: 30),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
                elevation: 4,
                child: InkWell(
                  child: ListTile(
                    title: Text(
                      'Cadastrar',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        CadastroScreen.id,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

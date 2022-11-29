import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokemon/screens/login_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 10),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/pikachu.gif')
            ),
            Text(
              'Loading...',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 11.0,
            )
          ],
        ),
      ),
    );
  }
}
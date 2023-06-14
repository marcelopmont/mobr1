// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontFamily: 'DancingScript',
      fontSize: 30,
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/cat.jpg'),
                radius: 100,
              ),
              SizedBox(height: 32),
              Text(
                'Marcelo',
                textAlign: TextAlign.start,
                style: textStyle,
              ),
              Text(
                'Montanher',
                textAlign: TextAlign.end,
                style: textStyle,
              ),
              SizedBox(height: 32),
              RoundedButton(
                icon: Icons.phone,
                text: '+55 11 99999-9999',
                onPressed: () {
                  launchUrl(
                    Uri.parse('whatsapp://send?phone=5511999999999&text=Olá'),
                  );
                },
              ),
              SizedBox(height: 16),
              RoundedButton(
                icon: Icons.email,
                text: 'teste@gmail.com',
                onPressed: () {
                  launchUrl(
                    Uri(
                      scheme: 'mailto',
                      path: 'teste@gmail.com',
                      query: 'subject=Teste&body=Testando email automático',
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(1000),
      elevation: 8,
      child: ListTile(
        onTap: onPressed,
        leading: Icon(icon, color: Colors.teal),
        title: Text(
          text,
          style: TextStyle(
            color: Colors.teal,
          ),
        ),
      ),
    );
  }
}

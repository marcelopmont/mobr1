// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobr1/screens/personal_card/personal_card_screen.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/menu_screen';

  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: Material(
                  borderRadius: BorderRadius.circular(1000),
                  elevation: 8,
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PersonalCardScreen.routeName,
                        arguments: PersonalCardScreenParams(
                          phoneNumber: '123456789',
                          email: 'teste@testinho.com',
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(1000),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Cartão pessoal',
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
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

import 'package:flutter/material.dart';
import 'package:mobr1/screens/dice/dice_screen.dart';
import 'package:mobr1/screens/menu/menu_screen.dart';
import 'package:mobr1/screens/personal_card/personal_card_screen.dart';

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
      initialRoute: MenuScreen.routeName,
      routes: {
        MenuScreen.routeName: (_) => const MenuScreen(),
        PersonalCardScreen.routeName: (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments
              as PersonalCardScreenParams;
          return PersonalCardScreen(
            params: arguments,
          );
        },
        DiceScreen.routeName: (_) => const DiceScreen(),
      },
    );
  }
}

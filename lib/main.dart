import 'package:collection/collection.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:mobr1/screens/auth/auth_screen.dart';
import 'package:mobr1/screens/dice/dice_screen.dart';
import 'package:mobr1/screens/menu/menu_screen.dart';
import 'package:mobr1/screens/movies/movies_screen.dart';
import 'package:mobr1/screens/personal_card/personal_card_screen.dart';
import 'package:mobr1/screens/quiz/quiz_finished_screen.dart';
import 'package:mobr1/screens/quiz/quiz_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  T? cast<T>(x) => x is T ? x : null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //initialRoute: AuthScreen.routeName,
      onGenerateRoute: (route) {
        switch(route.name) {
          case AuthScreen.routeName:
            return MaterialPageRoute(
              builder: (_) => AuthScreen(),
            );
          case MenuScreen.routeName:
            return MaterialPageRoute(
              builder: (_) => const MenuScreen(),
            );
          case PersonalCardScreen.routeName:
            final arguments = cast<PersonalCardScreenParams>(route.arguments);
            return MaterialPageRoute(
              builder: (_) => PersonalCardScreen(
                params: arguments!,
              ),
            );
          case DiceScreen.routeName:
            return MaterialPageRoute(
              builder: (_) => const DiceScreen(),
            );
          case QuizScreen.routeName:
            return PageRouteBuilder(
              pageBuilder: (_, __, ___) => const QuizScreen(),
              transitionsBuilder: (_, animation, __, child) {
                const begin = Offset(0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

                return SlideTransition(
                  position: animation.drive(tween),
                  child: child,
                );
              },
            );
          case QuizFinishedScreen.routeName:
            final arguments = cast<QuizFinishedScreenParams>(route.arguments);
            return MaterialPageRoute(
              builder: (_) => QuizFinishedScreen(
                params: arguments!,
              ),
            );
          case MoviesScreen.routeName:
            return MaterialPageRoute(
              builder: (_) => const MoviesScreen(),
            );
          default:
            throw Exception('Route not found');
        }
      },
    );
  }
}

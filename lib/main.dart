import 'package:flutter/material.dart';

import 'core/helpers/on_generate_route.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruit Hub',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      initialRoute: SplashView.routeName,
    );
  }
}

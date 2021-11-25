import '/screens/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
            bodyText1: TextStyle(
              fontSize: 18,
              color: Color(0xFF8D8E98),
            ),
            headline4: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFF0A0E21),
          secondary: Colors.pink,
        ),
      ),
      home: const InputPage(),
    );
  }
}

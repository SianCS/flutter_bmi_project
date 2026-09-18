import 'package:BmiCalculator/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    const BmiCalculator(),
  );
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({
    super.key,
  });

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.kanitTextTheme()),
      home: SplashScreenUi(),
    );
  }
}

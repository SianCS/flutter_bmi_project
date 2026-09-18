import 'package:BmiCalculator/views/about_ui.dart';
import 'package:BmiCalculator/views/bmi_ui.dart';
import 'package:BmiCalculator/views/bmr_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  int _currentIndex = 1;

  List subViewShow = [
    BmiUi(),
    AboutUi(),
    BmrUi()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 84, 147, 255),
        title: Text(
          "Body WoW",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        selectedItemColor: Colors.blue,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "BMI",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "About"),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.heartCircleCheck), label: "Heart"),
        ],
      ),
      body: subViewShow[_currentIndex],
    );
  }
}

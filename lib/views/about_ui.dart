import 'package:flutter/material.dart';

class AboutUi extends StatelessWidget {
  const AboutUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 219, 248),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Body Health Calculator",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025, fontWeight: FontWeight.bold, color: Colors.lightBlue),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/calculate.png",
                  width: MediaQuery.of(context).size.height * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "คำนวณดัชดีมวลกาย (ฺBMI)",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
                Text(
                  "คำนวณแคลออัตราการเผาผราญรี่ของร่างกาย (BMR)",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.015,
                  ),
                )
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  "assets/images/saulogo.png",
                  width: MediaQuery.of(context).size.height * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  fit: BoxFit.cover,
                ),
                Text("@ 2026 SAU. All right reseved"),
                Text("Create by SAU Software Development Team"),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

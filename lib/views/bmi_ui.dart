import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  final TextEditingController weightCtrl = TextEditingController();
  final TextEditingController heightCtrl = TextEditingController();

  String showBmi = "0.00";
  String showResult = "การแปลผล";

  @override
  void dispose() {
    weightCtrl.dispose();
    heightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(55),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Image.asset(
                  'assets/images/bmi.png',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.028,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (weightCtrl.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกน้ำหนักของคุณ'),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    if (heightCtrl.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกส่วนสูงของคุณ'),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final weight = double.tryParse(weightCtrl.text.trim());
                    final heightCm = double.tryParse(heightCtrl.text.trim());
                    if (weight == null || heightCm == null || weight <= 0 || heightCm <= 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'กรุณากรอกน้ำหนักและส่วนสูงเป็นตัวเลขที่มากกว่า 0',
                          ),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    final heightM = heightCm / 100;
                    final bmi = weight / (heightM * heightM);
                    setState(() {
                      showBmi = bmi.toStringAsFixed(2);
                      if (bmi < 18.5) {
                        showResult = "น้ำหนักน้อย / ผอม";
                      } else if (bmi < 23) {
                        showResult = "น้ำหนักปกติ / สุขภาพดี";
                      } else if (bmi < 25) {
                        showResult = "น้ำหนักเกิน / ท้วม";
                      } else if (bmi < 30) {
                        showResult = "โรคอ้วน / อ้วน";
                      } else {
                        showResult = "โรคอ้วนขั้นสูง / อ้วนมาก";
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                ElevatedButton(
                  onPressed: () {
                    weightCtrl.clear();
                    heightCtrl.clear();
                    setState(() {
                      showBmi = "0.00";
                      showResult = "การแปลผล";
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                // แสดงผล BMI
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        showBmi,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Text(
                        showResult,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

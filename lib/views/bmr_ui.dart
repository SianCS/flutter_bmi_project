import 'package:flutter/material.dart';

class BmrUi extends StatefulWidget {
  const BmrUi({super.key});

  @override
  State<BmrUi> createState() => _BmrUiState();
}

class _BmrUiState extends State<BmrUi> {
  bool isMale = true;

  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  String showBmr = "0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(55),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาอัตราการเผาผลาญที่',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ร่างกายต้องการ (BMR)',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.026,
                ),
                Image.asset(
                  'assets/images/bmr.png',
                  width: MediaQuery.of(context).size.width * 0.33,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.026,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เพศ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isMale ? Colors.blue : Colors.white,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.height * 0.06,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Text(
                        'ชาย',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.0355,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.044,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isMale ? Colors.white : Colors.pink,
                        fixedSize: Size(
                          MediaQuery.of(context).size.width * 0.35,
                          MediaQuery.of(context).size.height * 0.06,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Text(
                        'หญิง',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * 0.0355,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
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
                    hintText: 'กรอกน้ำหนักของคุณ',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
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
                    hintText: 'กรอกส่วนสูงของคุณ',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อายุ (ปี)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: ageCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรอกอายุของคุณ',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (weightCtrl.text.isEmpty || heightCtrl.text.isEmpty || ageCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                        ),
                      );
                      return;
                    }

                    double weight = double.parse(weightCtrl.text);
                    double height = double.parse(heightCtrl.text);
                    int age = int.parse(ageCtrl.text);
                    double bmr;
                    if (isMale == true) {
                      bmr = 88 + (13.3 * weight) + (4.7 * height) - (6.8 * age);
                    } else {
                      bmr = 447 + (9.2 * weight) + (3 * height) - (4.3 * age);
                    }
                    setState(() {
                      showBmr = bmr.toStringAsFixed(2);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.06,
                    ),
                  ),
                  child: Text(
                    'คำนวณ BMR',
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
                    ageCtrl.clear();
                    setState(() {
                      showBmr = "0.00";
                      isMale = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[400],
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.06,
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
                //แสดงผล BMR
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
                        'BMR',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        showBmr,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Text(
                        'kcal/day',
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

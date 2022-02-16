import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/left_bar.dart';
import 'package:bmi_calculator/widgets/right_bar.dart';
import 'package:bmi_calculator/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0.1;
  String _textResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: accenetHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accenetHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height(m)",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accenetHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Weight",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double height = double.parse(_heightController.text);
                double weight = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = weight / (height * height);
                  if (_bmiResult < 18.5) {
                    _textResult = "Underweight";
                  } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
                    _textResult = "Normal";
                  } else if (_bmiResult >= 25 && _bmiResult < 30) {
                    _textResult = "Overweight";
                  } else {
                    _textResult = "Obese";
                  }
                });
              },
              child: Container(
                child: Text("Calculate",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: accenetHexColor,
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 90,
                    color: accenetHexColor,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(_textResult,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accenetHexColor,
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LeftBar(
              barWidth: 40,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 20,
            ),
            LeftBar(barWidth: 40),
            RightBar(barWidth: 70),
            SizedBox(
              height: 30,
            ),
            RightBar(barWidth: 50),
          ],
        ),
      ),
    );
  }
}

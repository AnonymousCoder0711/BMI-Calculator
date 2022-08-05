import 'package:flutter/material.dart';
import 'package:bmi/constants/colors_constant.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = ' ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        title: Text('BMI Calculator',
            style: TextStyle(
                fontSize: 32,
                color: accentHexColor,
                fontWeight: FontWeight.w300)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //For Height TextField
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),

                //For Weight TextField
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 42,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(.8)),
                    ),
                  ),
                ),
              ],
            ), //Row
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25)
                    _textResult = 'You\'r overweight';
                  else if (_bmiResult >= 18.5 && _bmiResult < 25)
                    _textResult = 'You\'ve normal weight';
                  else
                    _textResult = 'You\'r underweight';
                });
              },
              child: Text('Calculate',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor)),
            ),
            SizedBox(height: 50),
            Container(
              child: Text(_bmiResult.toStringAsFixed(2),
                  style: TextStyle(fontSize: 90, color: accentHexColor)),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult
                  .isNotEmpty, // if _textResult is not Empty then show the value of the _textResult otherwise don't show anything
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(fontSize: 32, color: accentHexColor),
                ),
              ),
            ),
            SizedBox(height: 30),
            RightBar(barWidth: 40),
            SizedBox(height: 15),
            RightBar(barWidth: 80),
            SizedBox(height: 15),
            RightBar(barWidth: 40),
            SizedBox(height: 30),
            LeftBar(barWidth: 50),
            SizedBox(height: 20),
            LeftBar(barWidth: 50),
          ],
        ),
      ),
    );
  }
}


























/*
import 'package:flutter/material.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:bmi/constants/colors_constant.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainHexColor,
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Weight',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
              ], //Children of Row
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);

                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = 'You\'r over weight';
                  } else if (_bmiResult >= 18.5 && _bmiResult < 25) {
                    _textResult = 'You have normal weight';
                  } else {
                    _textResult = 'You are under weight';
                  }
                });
              },
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 30),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentHexColor,
                  ),
                ),
              ),
            ),
            //Right Bar
            SizedBox(height: 30),
            RightBar(barWidth: 30),
            SizedBox(height: 10),
            RightBar(barWidth: 60),
            SizedBox(height: 10),
            RightBar(barWidth: 30),
            SizedBox(height: 50),
            //Left Bar
            LeftBar(barWidth: 40),
            SizedBox(height: 30),
            LeftBar(barWidth: 40),
          ], //Children of Column
        ),
      ),
    );
  }
}
*/
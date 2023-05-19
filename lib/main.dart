import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';

/*
*
*/
void main() => runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFF00004d)
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  double _height = 170.0;
  double _weight = 63.0;
  //int _bmi =0;
  String _condition = "Select Data";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 55.0, horizontal: 10.0),
              height: size.height * 0.40,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "BMI calculator",
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                  SizedBox(height: 20), // Add spacing between text and image
                  Center(
                    child: Image.asset(
                      "assets/bmi.png", // Replace with your image asset path
                      width: 200,
                      height: 120,
                    ),
                  ),
                ],
              ),
            ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(20.0),
          ),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.03),
                  RichText(
                    text: TextSpan(
                      text: "Height :",
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${_height.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 255,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "${_height.toStringAsFixed(2)}",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RichText(
                    text: TextSpan(
                      text: "Weight :",
                      style: TextStyle(color: Colors.black, fontSize: 25.0),
                      children: <TextSpan>[
                        TextSpan(
                          text: "${_weight.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 200,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor: Color(0xFF403f3d),
                    inactiveColor: Colors.grey,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    width: size.width * 0.5,
                    child: ClipRect(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the new BMI result screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BmiResultScreen(
                                // Pass the required data to the new screen
                                height: _height,
                                weight: _weight,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.black),
                          backgroundColor: Color(0xFF00004d),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            "Calculate",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                ],
              ),
            ),
      ),
          ],
        ),
      ),
    );
  }
}
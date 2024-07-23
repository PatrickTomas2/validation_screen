import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ValidationScreen());
}

class ValidationScreen extends StatelessWidget {
  ValidationScreen({super.key});

  final codeDigitOne = TextEditingController();
  final codeDigitTwo = TextEditingController();
  final codeDigitThree = TextEditingController();
  final codeDigitFour = TextEditingController();
  final codeDigitFive = TextEditingController();
  final codeDigitSix = TextEditingController();

  void submitValidationCode() {
    // print(codeDigitOne.text);

    if (codeDigitOne.text.isEmpty ||
        codeDigitTwo.text.isEmpty ||
        codeDigitThree.text.isEmpty ||
        codeDigitFour.text.isEmpty ||
        codeDigitFive.text.isEmpty ||
        codeDigitSix.text.isEmpty) {
      print('all are required');
      return;
    }

    print("goods");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            width: 850,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black87,
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/validation_logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Authenticate Your Account',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Please confirm your account by entering the authorization code sent to your email address.',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CodeInputFields(controller: codeDigitOne),
                      const SizedBox(width: 10),
                      CodeInputFields(controller: codeDigitTwo),
                      const SizedBox(width: 10),
                      CodeInputFields(controller: codeDigitThree),
                      const SizedBox(width: 10),
                      CodeInputFields(controller: codeDigitFour),
                      const SizedBox(width: 10),
                      CodeInputFields(controller: codeDigitFive),
                      const SizedBox(width: 10),
                      CodeInputFields(controller: codeDigitSix),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                              "It may take a minute to receive your code. Haven’t received it?"),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Resend a new code.',
                              style: TextStyle(
                                color: Color(0xFF0038FF),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: submitValidationCode,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0038FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'SUBMIT',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CodeInputFields extends StatelessWidget {
  final TextEditingController controller;
  const CodeInputFields({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 30,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/Screens/quizScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2341),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(
            flex: 2,
          ),
          const Text(
            "Let's Play Quiz",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          const Text(
            "Enter Your Full Name",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          const Padding(
            padding: EdgeInsets.all(
              15.0,
            ),
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF3F4768),
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Full Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  borderSide: BorderSide(
                    color: Color(0xFF3F4768),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 150.0,
          ),
          GestureDetector(
            onTap: () {
              Get.to(const QuizScreen());
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50.0,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                border: Border.all(color: const Color(0xFF3F4768), width: 1),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: const Center(
                child: Text(
                  "Start",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

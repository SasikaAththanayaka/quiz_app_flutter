// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/ProgressController.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProgressController _qestionController = Get.put(ProgressController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        color: const Color(0xFF1C2341),
        width: double.infinity,
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            const Text(
              "Score",
              style: TextStyle(
                color: Colors.white60,
                fontSize: 40.0,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "${_qestionController.numOfCorrectAns * 10}/${_qestionController.question.length * 10}",
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 25.0,
              ),
            ),
            const Spacer(),
          ],
        )),
      ),
    );
  }
}

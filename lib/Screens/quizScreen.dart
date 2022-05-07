// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/ProgressController.dart';
import 'package:quiz_app/widgets/ProgressBar.dart';
import 'package:quiz_app/widgets/QuestionCard.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProgressController _qestionController = Get.put(ProgressController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          FlatButton(
            onPressed: _qestionController.nextQuestion,
            child: const Text(
              "skip",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        color: const Color(0xFF1C2341),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                const ProgressBar(),
                const SizedBox(
                  height: 15.0,
                ),
                Obx(
                  () => Text.rich(
                    TextSpan(
                        text:
                            "Question ${_qestionController.questionNumber.value}",
                        style: const TextStyle(
                          color: Colors.white54,
                          fontSize: 30.0,
                        )),
                  ),
                ),
                const Divider(
                  thickness: 1.5,
                  color: Colors.white24,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                    child: PageView.builder(
                  onPageChanged: _qestionController.updateQnNumber,
                  //block swipe to next question
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _qestionController.pageCotroller,
                  itemCount: _qestionController.question.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _qestionController.question[index]),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

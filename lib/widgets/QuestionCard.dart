// ignore_for_file: file_names

import 'package:flutter/material.dart'
    show
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Color,
        Colors,
        Column,
        Container,
        EdgeInsets,
        Key,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget;
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:quiz_app/controller/ProgressController.dart';
import 'package:quiz_app/model/Question.dart';
import 'package:quiz_app/widgets/Option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);
  final Question question;
  @override
  Widget build(BuildContext context) {
    ProgressController _controller = Get.put(ProgressController());
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      padding: const EdgeInsets.all(
        20.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          25.0,
        ),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: const TextStyle(
              color: Color(0xFF101010),
              fontSize: 25.0,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ...List.generate(
            question.options!.length,
            (index) => Option(
              index: index,
              text: question.options![index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}

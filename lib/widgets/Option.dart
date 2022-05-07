// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/ProgressController.dart';

class Option extends StatelessWidget {
  const Option({
    Key? key,
    required this.text,
    required this.index,
    required this.press,
  }) : super(key: key);
  final String text;
  final int index;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProgressController>(
        init: ProgressController(),
        builder: (qnController) {
          Color getTheRightColor() {
            if (qnController.isAnswered) {
              if (index == qnController.correctAns) {
                return const Color(0xFF6AC259);
              } else if (index == qnController.selectedAns &&
                  qnController.selectedAns != qnController.correctAns) {
                return const Color(0xFFE92E30);
              }
            }
            return const Color(0xFFC1C1C1);
          }

          IconData getTheRightIcon() {
            return getTheRightColor() == const Color(0xFFE92E30)
                ? Icons.close
                : Icons.done;
          }

          return InkWell(
            onTap: press,
            child: Container(
              margin: const EdgeInsets.only(top: 20.0),
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: getTheRightColor(),
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${index + 1}. $text",
                    style: TextStyle(
                      color: getTheRightColor(),
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    height: 26.0,
                    width: 26.0,
                    decoration: BoxDecoration(
                      color: getTheRightColor() == const Color(0xFFC1C1C1)
                          ? Colors.transparent
                          : getTheRightColor(),
                      border: Border.all(
                        color: getTheRightColor(),
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: getTheRightColor() == const Color(0xFFC1C1C1)
                        ? null
                        : Icon(
                            getTheRightIcon(),
                            size: 18.0,
                          ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz_app/controller/ProgressController.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF3F4768), width: 1),
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: GetBuilder<ProgressController>(
        init: ProgressController(),
        builder: (controller) {
          //print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth * controller.animation.value,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              Positioned.fill(
                  child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${(controller.animation.value * 60).round()} sec",
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.alarm,
                      color: Colors.white,
                    ),
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}

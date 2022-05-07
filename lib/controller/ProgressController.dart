// ignore_for_file: override_on_non_overriding_member, unnecessary_this, deprecated_member_use, unnecessary_import, file_names

import 'package:flutter/material.dart';

import 'package:quiz_app/Screens/ScoreScreen.dart';

import 'package:quiz_app/model/Question.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class ProgressController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => this._animation;

  late PageController _pageController;
  PageController get pageCotroller => this._pageController;

  final List<Question> _question = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get question => this._question;
  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  final RxInt _questrionNumber = 1.obs;
  RxInt get questionNumber => this._questrionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  @override
  void onInit() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });

    //Once timer is finished then go to the next question
    _animationController.forward().whenComplete(() => nextQuestion());

    _pageController = PageController();

    super.onInit();
  }

  //called just before the controller is deleted from memory
  @override
  void onclose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    if (_correctAns == _selectedAns) _numOfCorrectAns++;
    _animationController.stop();
    update();

    //Once user select an answer after 3s it will go to the next question
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questrionNumber.value != _question.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: const Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      // ignore: prefer_const_constructors
      Get.to(ScoreScreen()); //to(ScoreScreen());
    }
  }

  void updateQnNumber(int index) {
    _questrionNumber.value = index + 1;
  }
}

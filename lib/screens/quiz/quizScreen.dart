import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/screens/quiz/components/body.dart';

class quizScreen extends StatelessWidget {
  const quizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor:Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip",style: TextStyle(color: Colors.white),))
        ],
      ),
      body: Body(),
    );
  }
}
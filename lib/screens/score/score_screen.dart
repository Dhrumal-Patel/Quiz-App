import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/screens/welcomeScreen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: ScoreBoard(context, _qnController),
    );
  }

  Stack ScoreBoard(BuildContext context, QuestionController _qnController) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset("asset/icons/done.jpg", fit: BoxFit.fill),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kSecondaryColor),
            ),
            SizedBox(height: 45,),
            Text(
              "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: kSecondaryColor),
            ),
            SizedBox(height: 35,),
            InkWell(
                            onTap: () => Get.to(welcomeScreen()),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(kDefualtPadding * 0.75),
                              decoration: BoxDecoration(
                                  gradient: kPrimaryGradiant,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Text(
                                "Let's Play Again",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(color: Colors.black),
                              ),
                            ),
                          ),
          ],
        )
      ],
    );
  }
}
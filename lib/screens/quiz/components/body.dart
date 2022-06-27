import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/controller/question_controller.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/quiz/components/Question_card.dart';
import 'package:quiz_app/screens/quiz/components/progress_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/icons/done.jpg"), fit: BoxFit.cover)),
      child: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kDefualtPadding),
            child: Column(
              children: [
                ProgressBar(),
                SizedBox(
                  height: kDefualtPadding,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kDefualtPadding),
                  child: Obx(
                    () => 
                     Text.rich(TextSpan(
                      text: "${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: kSecondaryColor),
                      children: [
                        TextSpan(
                            text: "/${_questionController.questions.length}",
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: kSecondaryColor))
                      ],
                    )),
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                SizedBox(height: kDefualtPadding),
                SizedBox(
                    height: 600.0,
                    child: PageView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _questionController.pageController,
                        onPageChanged: _questionController.updateTheQnNum,
                        itemCount: _questionController.questions.length,
                        itemBuilder: (context, index) => QuestionCard(
                              question: _questionController.questions[index],
                            )))
              ],
            ),
          ),
        ],
      )),
    );
  }
}

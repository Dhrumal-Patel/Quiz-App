import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz_app/constant.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiz_app/controller/question_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              width: double.infinity,
              height: 45,
              decoration:BoxDecoration(border: Border.all(color: Color(0xFF3F4768),width: 3),
              borderRadius: BorderRadius.circular(50),),
             child: GetBuilder<QuestionController>(
        init: QuestionController(),
        builder: (controller) {
                  return Stack(children: [
                    LayoutBuilder(builder: (context, constraints) => Container(
                      
                      width: constraints.maxWidth*controller.animation.value,
                      decoration: BoxDecoration(gradient: kPrimaryGradiant,
                      borderRadius: BorderRadius.circular(50)),
                    )),
                    Positioned.fill(child: Padding(padding: EdgeInsets.symmetric(horizontal:kDefualtPadding / 2),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${(controller.animation.value * 60).round()} sec"),
                      SvgPicture.asset("asset/icons/clock.svg"),
                    ],),))
                  ]);
                }
              ),
            );
  }
}
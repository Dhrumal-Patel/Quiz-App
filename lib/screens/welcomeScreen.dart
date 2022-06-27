import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constant.dart';
import 'package:quiz_app/screens/quiz/quizScreen.dart';

class welcomeScreen extends StatelessWidget {
  welcomeScreen({Key? key}) : super(key: key);
  TextEditingController myController = TextEditingController();
  late String text;
  void _setText() {
    setState(() {
      text = myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(fit: StackFit.expand, children: [
        Image.asset(
          "asset/icons/done.jpg",
          fit: BoxFit.fill,
        ),
        SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kDefualtPadding),
                child: Center(
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Let's Play Quiz,",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                                      SizedBox(height:45),
                          Text("Enter your information below",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.white)),
                          SizedBox(height: 20),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: myController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFF1C2341).withOpacity(0.5),
                              floatingLabelStyle:
                                  TextStyle(color: Colors.white),
                              hintText: "Full Name",
                              hintStyle: TextStyle(color: Colors.white),
                              
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                            focusedBorder:  OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                            ),
                          ),
                          SizedBox(height: 35),
                          InkWell(
                            onTap: () => Get.to(quizScreen()),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(kDefualtPadding * 0.75),
                              decoration: BoxDecoration(
                                  gradient: kPrimaryGradiant,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                              child: Text(
                                "Let's Start Quiz",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(color: Colors.black),
                              ),
                            ),
                          ),
                        ]),
                  ),
                )))
      ]),
    );
  }

  void setState(Null Function() param0) {}
}

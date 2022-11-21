import 'package:flutter/material.dart';
import 'package:shop_app/cubit/cubit.dart';
import 'package:shop_app/functions/used_functions.dart';
import 'package:shop_app/network/local/cache_helper.dart';
import 'package:shop_app/pages/authentication_pages/login/cubit/login_cubit.dart';
import 'package:shop_app/pages/authentication_pages/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardingModel {
  final String title;
  final String body;

  BoardingModel({required this.body, required this.title});
}

class OnBoardScreen extends StatelessWidget {
  OnBoardScreen({Key? key}) : super(key: key);
  List<BoardingModel> boarding = [
    BoardingModel(
      body: 'On Board body 1',
      title: 'On Board title 1',
    ),
    BoardingModel(
      body: 'On Board body 2',
      title: 'On Board title 2',
    ),
    BoardingModel(
      body: 'On Board body 2',
      title: 'On Board title 3',
    ),
  ];

  var pageViewController = PageController();

  bool isLast = false;

  void submitter(context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value!) AppCubit.get(context).navigateAndFinish(context, LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                submitter(context);
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: StatefulBuilder(
                builder: (context, myState) => PageView.builder(
                  controller: pageViewController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    if (boarding.length - 1 == index) {
                      myState(() {
                        isLast = true;
                      });
                    } else {
                      myState(() {
                        isLast = false;
                      });
                    }
                  },
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: pageViewController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(dotWidth: 10, dotHeight: 10),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (isLast) {
                        submitter(context);
                      } else {
                        pageViewController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Text('Next'))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            color: Colors.blueGrey,
          ),
        )),
        Text(
          model.title,
          style: TextStyle(fontSize: 25),
        ),
        Text(
          model.body,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}

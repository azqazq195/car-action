import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:frontend/on_board/components/animated_text.dart';
import 'package:frontend/on_board/components/kakao_login_button.dart';
import 'package:frontend/on_board/components/progress_bar.dart';
import 'package:frontend/on_board/on_board.dart';
import 'package:lottie/lottie.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen>
    with SingleTickerProviderStateMixin {
  List<OnBoard> onBoardData = demo_data;
  late CarouselController _carouselController;
  late AnimationController _progressController;
  late Timer _timer;
  int currentPage = 0;
  double progressValue = 0;

  @override
  void initState() {
    _carouselController = CarouselController();
    _progressController =
        AnimationController(vsync: this, value: progressValue);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _progressController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    progressValue = 0;
    _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      progressValue += 0.002;
      setState(() {
        progressValue = progressValue;
      });
    });
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() {
      currentPage = index;
      progressValue = index.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: ProgressBar(
                progressController: _progressController,
                length: onBoardData.length,
                value: progressValue,
              ),
            ),
            Expanded(
              flex: 2,
              child: AnimatedText(
                key: ValueKey<int>(currentPage),
                title: onBoardData[currentPage].title,
                description: onBoardData[currentPage].description,
              ),
            ),
            Expanded(
              flex: 5,
              child: CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: onBoardData.length,
                itemBuilder: (context, itemIndex, _) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Lottie.asset(
                    onBoardData[itemIndex].imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
                options: CarouselOptions(
                  onPageChanged: onPageChanged,
                  height: double.infinity,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(30, 88, 30, 60),
              child: KakaoLoginButton(),
            ),
          ],
        ),
      ),
    );
  }
}

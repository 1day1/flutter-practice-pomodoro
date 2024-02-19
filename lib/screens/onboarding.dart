import 'package:flutter/material.dart';
import 'package:pomodoro/components/onboarding_data.dart';
import 'package:pomodoro/components/onboarding_info.dart';
import 'package:pomodoro/main.dart';
import 'package:pomodoro/screens/home_screen.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = OnboardingData();
  final pageController = PageController();
  late List<SliderModel> mySLides;
  int currentIndex = 0;

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();

    mySLides = getSlides();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          body(),
          buildDots(),
          button(),
        ],
      ),
    );
  }

  // body
  Widget body() {
    // print(mySLides[0].title);

    // print("aaa - ${controller.items.length}");
    // print("bbb - ${controller.items[0].title}");
    return Expanded(
      child: Center(
        child: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
              isLastPage = currentIndex == mySLides.length - 1 ? true : false;
            });
          },
          itemCount: mySLides.length,
          controller: pageController,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    mySLides[currentIndex].image,
                    scale: 1.5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    mySLides[currentIndex].title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      mySLides[currentIndex].desc,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).shadowColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  //Dots
  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          mySLides.length,
          (index) => AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: currentIndex == index
                    ? Theme.of(context).cardColor
                    : Colors.grey,
              ),
              height: 7,
              width: currentIndex == index ? 30 : 10,
              duration: const Duration(milliseconds: 700))),
    );
  }

  //Button
  Widget button() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).shadowColor,
      ),
      child: isLastPage
          ? getStarted()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      pageController.jumpToPage(mySLides.length - 1);
                      isLastPage = true;
                    });
                  },
                  child: const Text('Skip'),
                ),
                TextButton(
                  onPressed: () {
                    pageController.nextPage(
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.easeIn);
                    setState(() {
                      currentIndex != mySLides.length - 1
                          ? currentIndex++
                          : null;
                    });
                    if (currentIndex == mySLides.length - 1) {
                      setState(() {
                        isLastPage = true;
                      });
                    }
                  },
                  child: Text(
                    currentIndex == mySLides.length - 1
                        ? "Get started"
                        : "Next",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
    );
  }

  Widget getStarted() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).shadowColor),
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      child: TextButton(
          onPressed: () async {
            // same key
            if (!mounted) return;
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          child: const Text(
            "Get started",
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}

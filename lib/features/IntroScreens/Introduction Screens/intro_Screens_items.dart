import 'package:flutter/material.dart';
import 'package:shifts_management/UiHelpers/theme/Color_Palate.dart';
import 'package:shifts_management/features/AuthenticationScreens/Login%20Screen/Login_Screen.dart';
import 'package:shifts_management/features/IntroScreens/Introduction%20Screens/Helpers/Intro_items_info.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreensItems extends StatefulWidget {
  const IntroScreensItems({super.key});

  @override
  State<IntroScreensItems> createState() => _IntroScreensItemsState();
}

class _IntroScreensItemsState extends State<IntroScreensItems> {
  var pageController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    List<IntroItemsInfo> items = [
      IntroItemsInfo(
          title: "Create and Assign Shifts Effortlessly",
          desc:
              "Simplify Work Scheduling – Create and Assign Shifts with Ease!",
          image: Image.asset("assets/images/intro_image_1.png")),
      IntroItemsInfo(
          title: "Seamless Payroll and Compensation",
          desc: "Effortless Payroll – Accurate Payments, Every Time!",
          image: Image.asset("assets/images/intro_image_2.png")),
      IntroItemsInfo(
          title: "Get notified when work happens",
          desc: "Stay Ahead of the Game with Real-Time Work Notifications",
          image: Image.asset("assets/images/intro_image_3.png")),
    ];
    return Scaffold(
      body: PageView.builder(
        onPageChanged: (index) {
          isLastPage = items.length - 1 == index;
          setState(() {});
        },
        controller: pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              items[index].image,
              const SizedBox(
                height: 40,
              ),
              Text(
                textAlign: TextAlign.center,
                items[index].title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
                child: Text(
                  items[index].desc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => pageController.animateToPage(
                            items.length - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                      child: const Text(
                        "Skip",
                        style:
                            TextStyle(color: Color(0XFF00629D), fontSize: 18),
                      )),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: items.length,
                    effect: const WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        activeDotColor: Color(0XFF00629D)),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () => pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut),
                          child: const Text(
                            "Next",
                            style: TextStyle(
                                color: Color(0XFF00629D), fontSize: 18),
                          )),
                      const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 19,
                        color: Color(0XFF00629D),
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget getStarted() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Palate.primaryColor,
        ),
        height: 50,
        width: 300,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: const RoundedRectangleBorder()),
            onPressed: () async {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: const Text(
              "Get Started",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }
}

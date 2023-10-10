import 'package:flutter/material.dart';

import 'login_screen.dart';

class SliderScreen extends StatefulWidget {
  @override
  SliderScreenState createState() => SliderScreenState();
}

class SliderScreenState extends State<SliderScreen> {
  int currentIndex = 0;
  final  PageController pageController =PageController();
  final List<SliderItem> slides = [
    SliderItem(
      title: 'Welcome to\nFresh and Local',
      description: 'Fresh and Local',
      image: 'assets/images/markus-spiske-i5tesTFPBjw-unsplash 1.png',
    ),
    SliderItem(
      title: 'Buy Quality\nDairy Products',
      description: 'Discover amazing features and functionality.',
      image: 'assets/images/dairy.png',
    ),
    SliderItem(
      title: 'Buy Premium\nQuality Fruits',
      description: 'Tap the Get Started button to begin.',
      image: 'assets/images/fruits.png',
    ),
    SliderItem(
      title: 'Get Discounts \nOn All Products',
      description: 'Tap the Get Started button to begin.',
      image: 'assets/images/apple.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentIndex = pageController.page!.toInt();

        //////////Shubham Comment////////
        //////////Shubham Comment////////




      });
    });

  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: slides.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return SlideItemWidget(slide: slides[index]);
                },
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 10.0,
      height: 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? const Color(0xFF6CC51D) : const Color(0xFFDCDCDC),
      ),
    );
  }
}

class SliderItem {
  final String title;
  final String description;
  final String image;

  SliderItem({
    required this.title,
    required this.description,
    required this.image,
  });
}

class SlideItemWidget extends StatelessWidget {
  final SliderItem slide;

  SlideItemWidget({required this.slide});

  @override
  Widget build(BuildContext context) {
    final screenState = SliderScreenState();

    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(slide.image),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40.0),
              Text(
                slide.title,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF679887),
                  letterSpacing: 0.9,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              Text(
                slide.description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(height: 500),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  screenState.slides.length,
                      (index) => screenState.buildIndicator(index),
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x406CC51D), // Set shadow color
                      offset: Offset(0, 3), // Set shadow offset
                      blurRadius: 9.0, // Set shadow blur radius
                    ),
                  ],
                ),
                child: SizedBox(
                  width: 360.0, // Set the desired width
                  height: 50.0, // Set the desired height
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginScreen()),
                      );
                      // if (screenState.currentIndex < screenState.slides.length - 1) {
                      //   // Move to the next slide using PageController
                      //   screenState.pageController.nextPage(
                      //     duration: const Duration(milliseconds: 300),
                      //     curve: Curves.easeInOutBack,
                      //   );
                      // } else {

                        // Navigate to the next screen or perform some action
                        // when the last slide is reached
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0x406CC51D), // Set button color
                      shadowColor: const Color(0x406CC51D), // Set shadow color
                      shape: const RoundedRectangleBorder(),
                      padding: const EdgeInsets.all(1.0),
                    ),
                    child: Text(
                      screenState.currentIndex < screenState.slides.length - 1
                          ? 'Next'
                          : 'Get Started',
                      style: const TextStyle(color: Color(0xffFFFFFF)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


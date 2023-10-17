import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {

  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  final List<SliderItem> slides = [
    SliderItem(
      title: 'Welcome to ',
      description: 'Fresh and Local',
      image: 'assets/images/markus-spiske-i5tesTFPBjw-unsplash 1.png',
    ),
    SliderItem(
      title: 'Buy Quality \nDairy Products',
      description: 'Discover amazing features and functionality.',
      image: 'assets/images/dairy.png',
// Replace with your image asset
    ),
    SliderItem(
      title: 'Buy Premium\nQuality Fruits',
      description: 'Tap the Get Started button to begin.',
      image: 'assets/images/fruits.png',
// Replace with your image asset
    ),
    SliderItem(
      title: 'Get Discounts \nOn All Products',
      description: 'Tap the Get Started button to begin.',
      image: 'assets/images/apple.png',
// Replace with your image asset
    ),
  ];


  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              slides.length,
                  (index) => buildIndicator(index),
            ),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (currentIndex < slides.length - 1) {
                // Move to the next slide
                setState(() {
                  currentIndex++;
                });
              } else {
                // Navigate to the next screen or perform some action
                // when the last slide is reached
              }
            },
            child: Text(
              currentIndex < slides.length - 1 ? 'Next' : 'Get Started',
            ),
          ),
        ],
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

  SliderItem({required this.title, required this.description, required this.image,});
}

class SlideItemWidget extends StatelessWidget {
  final SliderItem slide;



  SlideItemWidget({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:  BoxDecoration(
        image: DecorationImage(
            image: AssetImage(slide.image),
            fit: BoxFit.cover),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Image.asset(
          //   slide.image,
          //   width: isLandscape ? 300.0 : 450.0,
          //   height: isLandscape ? 200.0 : 750.0,
          // ),
          const SizedBox(height: 50.0),
          Text(
            slide.title,
            style : const TextStyle(
              fontSize : 30,
              fontWeight :FontWeight.w500 ,
              color : Color(0xFF679887),
              letterSpacing : 0.9,
            ),
            textAlign : TextAlign.center,

          ),
          const SizedBox(height: 10.0),
          Text(
            slide.description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 50,),
          // ElevatedButton(
          //     onPressed: () {
          //       // Go to the next slide
          //       if (screen.currentPage < screen.slides.length - 1) {
          //         screen.pageController.nextPage(
          //           duration: const Duration(milliseconds: 300),
          //           curve: Curves.easeInOut,
          //         );
          //       }
          //     },
          //     child: const Text('Next')
          // )
        ],
      ),
    );
  }


}
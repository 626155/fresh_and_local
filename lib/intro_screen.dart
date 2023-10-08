import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderScreen extends StatelessWidget {
  final List<SliderItem> slides = [
    SliderItem(
      title: 'Welcome to MyApp',
      description: 'Your one-stop app for everything!',
      image: 'assets/slide1.png', // Replace with your image asset
    ),
    SliderItem(
      title: 'Explore Features',
      description: 'Discover amazing features and functionality.',
      image: 'assets/slide2.png', // Replace with your image asset
    ),
    SliderItem(
      title: 'Get Started',
      description: 'Tap the Get Started button to begin.',
      image: 'assets/slide3.png', // Replace with your image asset
    ),
  ];

   SliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;

          return PageView.builder(
            itemCount: slides.length,
            itemBuilder: (context, index) {
              return SlideItemWidget(slide: slides[index], isLandscape: isLandscape);
            },
          );
        },
      ),
    );
  }
}

class SliderItem {
  final String title;
  final String description;
  final String image;

  SliderItem({required this.title, required this.description, required this.image});
}

class SlideItemWidget extends StatelessWidget {
  final SliderItem slide;
  final bool isLandscape;

  const SlideItemWidget({super.key, required this.slide, required this.isLandscape});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          slide.image,
          width: isLandscape ? 300.0 : 200.0,
          height: isLandscape ? 200.0 : 300.0,
        ),
        const SizedBox(height: 20.0),
        Text(
          slide.title,
          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10.0),
        Text(
          slide.description,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
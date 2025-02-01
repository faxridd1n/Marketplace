import 'package:flutter/material.dart';

class CustomCarouselController extends CarouselController {
  final PageController _pageController;

  CustomCarouselController()
      : _pageController = PageController(), // Initialize the PageController
        super();

  PageController get pageController => _pageController;

  // Delegate PageController properties and methods
  double? get page => _pageController.page;

  Future<void> animateToPage(int page,
      {required Duration duration, required Curve curve}) {
    return _pageController.animateToPage(page, duration: duration, curve: curve);
  }

  void jumpToPage(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose(); // Ensure super class's dispose is called
  }
}

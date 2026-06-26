import 'dart:async';
import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/screen_helper.dart';

class ResponsiveCarousel extends StatefulWidget {
  const ResponsiveCarousel({super.key});

  @override
  State<ResponsiveCarousel> createState() => _ResponsiveCarouselState();
}

class _ResponsiveCarouselState extends State<ResponsiveCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  // Aapki images ki list
  final List<String> _carouselImages = [
    "assets/banner/innovate-build-inspire.jpeg",
    "assets/banner/collage-aword.jpeg",
    "assets/banner/news-paper.jpeg",
    "assets/banner/robo-webnare.jpeg",
  ];

  @override
  void initState() {
    super.initState();
    // Auto-scroll loop: Har 3 second me image badlegi
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _carouselImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // FIX: This widget used to return a top-level `Positioned(...)`.
    // `Positioned` is a ParentDataWidget and is ONLY valid when its direct
    // parent is a `Stack`. That worked on desktop (ResponsiveCarousel is a
    // direct child of a Stack there) but crashed on tablet/mobile, where it
    // was wrapped in a `Container` instead — hence the repeated
    // "Incorrect use of ParentDataWidget" errors.
    //
    // Now this widget just returns its own self-contained `Stack` and lets
    // it size itself to whatever the parent gives it. The caller decides
    // HOW to position/size it (Positioned on desktop, SizedBox/Container
    // on tablet/mobile) — see landing_page.dart.
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // 1. Image Slider
        PageView.builder(
          controller: _pageController,
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
          itemCount: _carouselImages.length,
          itemBuilder: (context, index) {
            return Image.asset(_carouselImages[index], fit: BoxFit.contain);
          },
        ),

        // 2. Dots Indicator (Optional: Agar dots nahi chahiye toh yeh Positioned hata sakte ho)
        Positioned(
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _carouselImages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentPage == index
                    ? 24
                    : 8, // Active dot thoda lamba dikhega
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppColor.primary
                      : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

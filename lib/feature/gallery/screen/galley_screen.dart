import 'package:flutter/material.dart';

import '../../../core/utils/screen_helper.dart';

class GalleyScreen extends StatefulWidget {
  const GalleyScreen({super.key});

  @override
  State<GalleyScreen> createState() => _GalleyScreenState();
}

class _GalleyScreenState extends State<GalleyScreen> {
  int _currentImageIndex = 0;

  final List<String> _gallery = [
    "assets/image/img.png",
    "assets/image/img1.jpeg",
    "assets/image/img2.jpeg",
    "assets/image/img3.jpeg",
    "assets/image/img4.jpeg",
    "assets/image/img5.jpeg",
    "assets/image/img6.jpeg",
  ];

  void _previousImage() {
    setState(() {
      if (_currentImageIndex > 0) {
        _currentImageIndex--;
      } else {
        _currentImageIndex = _gallery.length - 1; // Infinite loop back to last
      }
    });
  }

  // Next Image par jaane ka function
  void _nextImage() {
    setState(() {
      if (_currentImageIndex < _gallery.length - 1) {
        _currentImageIndex++;
      } else {
        _currentImageIndex = 0; // Infinite loop back to first
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Main Preview Banner Area
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    _gallery[_currentImageIndex], // Dynamic state asset bind kiya
                    height: ScreenHelper.isDesktop(context) ?400:250,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Navigation Arrow Controls
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Standard layout alignment
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        onPressed: _previousImage,
                        icon: const Padding(
                          padding: EdgeInsets.only(left: 6.0), // Icon centering layout hack
                          child: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      child: IconButton(
                        onPressed: _nextImage,
                        icon: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          const SizedBox(height: 24),

          // Horizontal Thumbnail Navigation Bar
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: List.generate(_gallery.length, (index) {
                final bool isSelected = _currentImageIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentImageIndex = index; // Thumbnail click par view switch hoga
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.only(right: 14),
                    width: 140, // Uniform responsive box parameters
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Colors.blue.shade600 : Colors.transparent,
                        width: 3,
                      ),
                      boxShadow: isSelected
                          ? [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 8, offset: const Offset(0, 4))]
                          : [],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        _gallery[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
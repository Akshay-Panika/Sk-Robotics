import 'dart:async';
import 'package:flutter/material.dart';

class PartnerPage extends StatefulWidget {
  const PartnerPage({super.key});

  @override
  State<PartnerPage> createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {
  final ScrollController _controller = ScrollController();
  Timer? _timer;

  final List<String> companies = [
    "Error False",
    "Zero+",
    "Suwidhaa",
    "Ravita Nexus",
    "Savishkar Mahakoshal"
  ];

  final List<String> logo = [
    "assets/logo/errorfalse.jpeg",
    "",
    "",
    "",
    "assets/logo/savishkar.jpeg"
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
        if (mounted && _controller.hasClients) {
          double next = _controller.offset + 1;
          if (next >= _controller.position.maxScrollExtent) {
            _controller.jumpTo(0);
          } else {
            _controller.jumpTo(next);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  _CarouselConfig _getConfig(double screenWidth) {
    if (screenWidth >= 1200) {
      return const _CarouselConfig(visibleItems: 7, height: 70, fontSize: 14, margin: 4, borderRadius: 8);
    } else if (screenWidth >= 900) {
      return const _CarouselConfig(visibleItems: 5, height: 70, fontSize: 13, margin: 4, borderRadius: 8);
    } else if (screenWidth >= 600) {
      return const _CarouselConfig(visibleItems: 4, height: 65, fontSize: 12, margin: 3, borderRadius: 6);
    } else {
      return const _CarouselConfig(visibleItems: 3, height: 60, fontSize: 11, margin: 3, borderRadius: 6);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final config = _getConfig(screenWidth);
    final itemWidth = screenWidth / config.visibleItems;

    return SizedBox(
      height: config.height,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: companies.length * 20,
        itemBuilder: (context, index) {
          final i = index % companies.length;
          final company = companies[i];
          final logoPath = logo[i];

          return Container(
            width: itemWidth,
            margin: EdgeInsets.all(config.margin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(config.borderRadius),
              border: Border.all(color: Colors.grey.shade300),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 4, offset: const Offset(0, 2)),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo ya Icon display
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: logoPath.isNotEmpty
                        ? Image.asset(logoPath, height: 30, fit: BoxFit.contain)
                        : const Icon(Icons.business, size: 18, color: Colors.grey),
                  ),
                  // Text jo ki center mein rahega
                  Flexible(
                    child: Text(
                      company,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: config.fontSize,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CarouselConfig {
  final double visibleItems;
  final double height;
  final double fontSize;
  final double margin;
  final double borderRadius;

  const _CarouselConfig({
    required this.visibleItems,
    required this.height,
    required this.fontSize,
    required this.margin,
    required this.borderRadius
  });
}
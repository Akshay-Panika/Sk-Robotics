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
    "Google",
    "Microsoft",
    "Amazon",
    "Infosys",
    "TCS",
    "Wipro",
    "IBM",
  ];

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(milliseconds: 30), (_) {
      if (_controller.hasClients) {
        double next = _controller.offset + 1;

        if (next >= _controller.position.maxScrollExtent) {
          _controller.jumpTo(0);
        } else {
          _controller.jumpTo(next);
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // FIX: Pulled all the screen-size-dependent values into one place.
  // Earlier there were only 3 buckets (>=1200, >=900, else) and only
  // `visibleItems` changed — height/font/margin stayed fixed, so on
  // small phones the cards looked cramped and text could overflow.
  // Now there are 4 buckets matching common breakpoints:
  //   >=1200  -> Desktop
  //   >=900   -> Tablet landscape / small laptop
  //   >=600   -> Tablet portrait
  //   <600    -> Mobile
  _CarouselConfig _getConfig(double screenWidth) {
    if (screenWidth >= 1200) {
      return const _CarouselConfig(
        visibleItems: 5,
        height: 120,
        fontSize: 18,
        margin: 8,
        borderRadius: 12,
      );
    } else if (screenWidth >= 900) {
      return const _CarouselConfig(
        visibleItems: 4,
        height: 110,
        fontSize: 16,
        margin: 8,
        borderRadius: 12,
      );
    } else if (screenWidth >= 600) {
      return const _CarouselConfig(
        visibleItems: 3,
        height: 100,
        fontSize: 15,
        margin: 6,
        borderRadius: 10,
      );
    } else {
      // Mobile: keep cards big enough to read but only show 2 at a time
      // so the company name never gets squeezed/clipped.
      return const _CarouselConfig(
        visibleItems: 2,
        height: 90,
        fontSize: 14,
        margin: 5,
        borderRadius: 10,
      );
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
        itemCount: companies.length * 20, // infinite feel
        itemBuilder: (context, index) {
          final company = companies[index % companies.length];

          return Container(
            width: itemWidth,
            margin: EdgeInsets.all(config.margin),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(config.borderRadius),
              border: Border.all(
                color: Colors.grey.shade200,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Padding(
                // FIX: small horizontal padding so longer names
                // (e.g. "Microsoft") don't touch the card edges on
                // narrow mobile widths.
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  company,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: config.fontSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Holds all the size-dependent values for one breakpoint, so build()
/// stays clean and every value scales together instead of independently.
class _CarouselConfig {
  final int visibleItems;
  final double height;
  final double fontSize;
  final double margin;
  final double borderRadius;

  const _CarouselConfig({
    required this.visibleItems,
    required this.height,
    required this.fontSize,
    required this.margin,
    required this.borderRadius,
  });
}
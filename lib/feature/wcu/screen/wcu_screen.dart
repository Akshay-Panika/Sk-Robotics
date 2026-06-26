import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/responsive_font.dart';
import '../../../core/utils/screen_helper.dart';

class WcuScreen extends StatelessWidget {
  const WcuScreen({super.key});

  final List<Map<String, String>> features = const [
    {
      "title": "Innovative Technology",
      "desc": "We leverage the latest advancements to provide cutting-edge solutions tailored to your specific project needs."
    },
    {
      "title": "Real-World Experience",
      "desc": "Our team brings a proven track record of successful hands-on project execution across diverse robotics industries."
    },
    {
      "title": "Embedded Expertise",
      "desc": "We possess deep, specialized proficiency in ESP32 hardware integration and robust firmware development cycles."
    },
    {
      "title": "Custom Development",
      "desc": "Every client is unique. We provide bespoke robotics and software architectures designed specifically for your goals."
    },
    {
      "title": "Reliable & Scalable",
      "desc": "Our engineering process prioritizes stability, ensuring your systems are ready for future growth and expansion."
    },
    {
      "title": "Expert Support",
      "desc": "We stand by our work, offering dedicated professional guidance and technical maintenance at every project stage."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Text(
            "Why Choose SK Robotics?",
            style: TextStyle(
              fontSize: RFont.size(context, 24, tablet: 32, desktop: 40),
              fontWeight: FontWeight.bold,
              color: AppColor.textPrimary,
            ),
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // Responsive columns
              crossAxisCount: ScreenHelper.isDesktop(context) ? 3 : (ScreenHelper.isTablet(context) ? 2 : 1),
              // Aspect ratio adjusted to fit 3 lines of text comfortably
              childAspectRatio: 2.9,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: features.length,
            itemBuilder: (context, index) => _buildFeatureCard(features[index]),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(Map<String, String> feature) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            feature["title"]!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColor.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            feature["desc"]!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 14,
              height: 1.5, // Improves readability for multi-line text
            ),
          ),
        ],
      ),
    );
  }
}
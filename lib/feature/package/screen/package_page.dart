import 'package:flutter/material.dart';
import 'package:sk_robotics/core/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_color.dart';

class PackagePage extends StatefulWidget {
  const PackagePage({super.key});

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {
  int _selectedIndex = 1;

  final List<Map<String, dynamic>> marketingPackages = [
    {
      "title": "Basic Setup",
      "duration": "pro",
      "price": "Custom",
      "color": const Color(0xFF10B981),
      "features": [
        "Circuit Design & Schematics",
        "Basic Arduino/ESP Firmware",
        "Component Selection Guide",
        "Standard Bug Support",
      ]
    },
    {
      "title": "Smart IoT",
      "duration": "pro",
      "price": "Flexible",
      "color": const Color(0xFF3B82F6),
      "isPopular": true,
      "features": [
        "ESP32/ESP8266 Architecture",
        "Real-Time Web Dashboard",
        "Sensor & Local Storage",
        "Dedicated Hardware Testing",
      ]
    },
    {
      "title": "Robotics Pro",
      "duration": "dev",
      "price": "Premium",
      "color": const Color(0xFF6366F1),
      "features": [
        "Autonomous Navigation Systems",
        "Advanced Sensor Integration",
        "Fail-Safe System Prototyping",
        "Full End-to-End Consultation",
      ]
    }
  ];

  Future<void> _launchWhatsApp(String packageTitle) async {
    const String phoneNumber = "917370027802";
    final String message = "Hello, I am interested in your '$packageTitle' development tier. Please provide more details.";
    final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not redirect to WhatsApp.");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mobile par cards ki width screen size ke according maintain karne ke liye
    final double screenWidth = MediaQuery.of(context).size.width;
    final double mobileCardWidth = screenWidth * 0.85; // 85% of screen width so next card is slightly visible

    return Container(
      color: const Color(0xFFFAFAFA),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenHelper.isDesktop(context) ? 24.0 : 0.0, // Mobile edge-to-edge scroll ke liye horizontal 0 kiya
        vertical: ScreenHelper.isDesktop(context) ? 64.0 : 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (Padding added for mobile since outer container padding is 0)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "Project Development Tiers",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF1E293B),
                      letterSpacing: -0.75,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    "Select a plan that fits your project. Swipe horizontally to explore plans.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 48),

          // Grid / Horizontal Layout Builder
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 900) {
                // CHANGED: Mobile/Tablet view is now HORIZONTAL scrollable
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10), // Safe spacing for box-shadows
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(marketingPackages.length, (index) {
                      return SizedBox(
                        width: mobileCardWidth, // Dynamically sized card width
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0), // Space between cards
                          child: _buildPremiumCard(index),
                        ),
                      );
                    }),
                  ),
                );
              } else {
                // Desktop view is still standard grid Row
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(marketingPackages.length, (index) {
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: _buildPremiumCard(index),
                      ),
                    );
                  }),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumCard(int index) {
    final pkg = marketingPackages[index];
    final bool isSelected = _selectedIndex == index;
    final bool isPopular = pkg["isPopular"] ?? false;
    final Color accentColor = pkg["color"];

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? accentColor : const Color(0xFFE2E8F0),
            width: isSelected ? 1.0 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? accentColor.withOpacity(0.12)
                  : const Color(0xFF0F172A).withOpacity(0.04),
              blurRadius: isSelected ? 32 : 24,
              offset: isSelected ? const Offset(0, 12) : const Offset(0, 8),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pkg["title"],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  if (isPopular)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "MOST POPULAR",
                        style: TextStyle(
                          color: accentColor,
                          fontSize: 9,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    pkg["price"],
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    " / ${pkg["duration"]}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(color: Color(0xFFF1F5F9), thickness: 1.5),
              const SizedBox(height: 24),

              ...List.generate((pkg["features"] as List).length, (fIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: accentColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          color: accentColor,
                          size: 14,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          pkg["features"][fIndex],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF475569),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: isSelected
                    ? ElevatedButton(
                  onPressed: () => _launchWhatsApp(pkg["title"]),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentColor,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Selected - Inquire Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                )
                    : OutlinedButton(
                  onPressed: () => _launchWhatsApp(pkg["title"]),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFCBD5E1), width: 1.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    "Inquire Plan",
                    style: TextStyle(
                      color: Color(0xFF475569),
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/screen_helper.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    final bool isTablet = ScreenHelper.isTablet(context);

    // Dynamic grid columns configuration based on screen sizes
    int crossAxisCount = isDesktop ? 4 : (isTablet ? 3 : 2);

    // Mock IoT & Robotics Projects Data Model List
    final List<Map<String, dynamic>> projects = [
      {
        "title": "Industrial Robotic Arm",
        "category": "ROBOTICS & KINEMATICS",
        "image": "https://images.unsplash.com/photo-1616401784845-180882ba9ba8?auto=format&fit=crop&q=80&w=600",
        "description": "A 4-Axis high-precision programmable robotic arm executing inverse kinematics algorithms for industrial sorting.",
        "status": "Completed"
      },
      {
        "title": "Smart Agriculture IoT Mesh",
        "category": "INTERNET OF THINGS (IoT)",
        "image": "https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&q=80&w=600",
        "description": "Decentralized sensor network nodes monitoring soil telemetry data with live dashboard cloud streaming via ESP32.",
        "status": "Live Track"
      },
      {
        "title": "LiDAR Autonomous Rover v2",
        "category": "AUTONOMOUS VEHICLES",
        "image": "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?auto=format&fit=crop&q=80&w=600",
        "description": "Self-navigating terrain rover integrated with dual LiDAR simulation mapping and real-time obstacle avoidance frameworks.",
        "status": "In Progress"
      },
      {
        "title": "Edge AI Computer Vision Node",
        "category": "ARTIFICIAL INTELLIGENCE",
        "image": "https://images.unsplash.com/photo-1555255707-c07966088b7b?auto=format&fit=crop&q=80&w=600",
        "description": "NPU-powered edge station executing custom OpenCV models for high-speed facial recognition and security gateway protocols.",
        "status": "Completed"
      }
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 60.0 : (isTablet ? 32.0 : 16.0),
        vertical: 40.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Subtitle Head
          const Text(
            "INNOVATION PORTFOLIO",
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 8),

          // Section Title Head
          const Text(
            "Our Featured Blueprints",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColor.textPrimary,
            ),
          ),
          const SizedBox(height: 32),

          // Symmetrical Responsive Projects Grid Matrix
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 380, // Bound alignment box parameters
            ),
            itemBuilder: (context, index) {
              final project = projects[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Network Image Section with rounded corners and loaders
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      child: SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: Image.network(
                          project["image"],
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              color: const Color(0xFFF1F5F9),
                              child: const Center(
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                                  ),
                                ),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: const Color(0xFFF1F5F9),
                            child: const Icon(Icons.broken_image_rounded, color: Color(0xFF94A3B8), size: 32),
                          ),
                        ),
                      ),
                    ),

                    // Content details structural frame
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Category Tag Text
                                Text(
                                  project["category"],
                                  style: const TextStyle(
                                    color: AppColor.primary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 6),

                                // Project Title Text
                                Text(
                                  project["title"],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: AppColor.textPrimary,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),

                                // Project Description text frame limits
                                Text(
                                  project["description"],
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontSize: 12.5,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),

                            // Bottom Status Row Anchor Panel
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColor.primary.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    project["status"],
                                    style: const TextStyle(
                                      color: AppColor.primary,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 18,
                                  color: Colors.grey.shade400,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
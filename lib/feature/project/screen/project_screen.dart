import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // REQUIRED for launching WhatsApp link channels
import '../../../core/utils/app_color.dart';
import '../../../core/utils/responsive_font.dart';
import '../../../core/utils/screen_helper.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  // FIXED: Method to launch WhatsApp with product-specific dynamic details
  Future<void> _launchWhatsAppProduct(Map<String, dynamic> prod) async {
    const String phoneNumber = "917370027802";

    // Constructing an explicit, clear contextual lead response message
    final String message =
        "Hello SK Robotics!\n\n"
        "I am interested in inquiring about the following hardware track:\n"
        "• Product: ${prod["title"]}\n"
        "• Track: ${prod["category"]}\n"
        "• Price Architecture: ${prod["price"]}\n\n"
        "Please provide details regarding module availability and sourcing setups.";

    final Uri whatsappUri = Uri.parse(
      "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not open specific product WhatsApp routing channel.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    final bool isTablet = ScreenHelper.isTablet(context);

    final List<Map<String, dynamic>> products = [
      {
        "title": "Autonomous Rover Kit v2",
        "category": "ROBOTICS KIT",
        "image": "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?auto=format&fit=crop&q=80&w=500",
        "description": "Smart hardware prototyping kit equipped with LiDAR simulation and mega microcontrollers.",
        "price": "₹4,999",
        "tags": ["LiDAR", "Arduino", "IoT"]
      },
      {
        "title": "IoT Smart Agriculture Kit",
        "category": "HARDWARE TRACK",
        "image": "https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&q=80&w=500",
        "description": "Complete sensor-based prototyping platform with automatic telemetry and live cloud dashboard nodes.",
        "price": "₹3,499",
        "tags": ["ESP32", "Sensors", "Cloud"]
      },
      {
        "title": "Quadruped Bionic Pack",
        "category": "ADVANCED KIT",
        "image": "https://images.unsplash.com/photo-1531747118685-ca8fa6e08806?auto=format&fit=crop&q=80&w=500",
        "description": "High-torque servo-driven spider architecture with integrated ESP-NOW wireless modules.",
        "price": "₹7,999",
        "tags": ["Bionics", "Servos", "Wireless"]
      },
      {
        "title": "AI-Driven Edge Vision Kit",
        "category": "AI & COMPUTER VISION",
        "image": "https://images.unsplash.com/photo-1555255707-c07966088b7b?auto=format&fit=crop&q=80&w=500",
        "description": "Embedded NPU core for real-time object detection, face recognition, and sorting tracks.",
        "price": "₹6,499",
        "tags": ["OpenCV", "Edge AI", "Camera"]
      },
      {
        "title": "Industrial Robotic Arm Pro",
        "category": "ROBOTICS KIT",
        "image": "https://images.unsplash.com/photo-1616401784845-180882ba9ba8?auto=format&fit=crop&q=80&w=500",
        "description": "4-Axis inverse kinematics programmable robotic arm with high-precision stepping motors.",
        "price": "₹9,999",
        "tags": ["Stepper", "Kinematics", "Steel"]
      },
      {
        "title": "Biometric Access Node v4",
        "category": "HARDWARE TRACK",
        "image": "https://images.unsplash.com/photo-1515378791036-0648a3ef77b2?auto=format&fit=crop&q=80&w=500",
        "description": "Enterprise-grade secure gateway track utilizing capacitive fingerprint arrays.",
        "price": "₹2,899",
        "tags": ["Biometrics", "OAuth2", "SPI"]
      },
      {
        "title": "Self-Balancing Pendulum",
        "category": "CONTROL SYSTEMS",
        "image": "https://images.unsplash.com/photo-1504639725590-34d0984388bd?auto=format&fit=crop&q=80&w=500",
        "description": "High-speed IMU dual-wheel stabilization track built for testing complex PID algorithms.",
        "price": "₹4,299",
        "tags": ["IMU 6050", "PID", "Realtime"]
      },
      {
        "title": "Smart Mesh Weather Station",
        "category": "IoT MESH TRACK",
        "image": "https://images.unsplash.com/photo-1530587191325-3db32d826c18?auto=format&fit=crop&q=80&w=500",
        "description": "Solar-powered decentralized environmental telemetry deck utilizing multi-hop LoRa radio nodes.",
        "price": "₹5,499",
        "tags": ["LoRa", "Solar", "Sensors"]
      },
      {
        "title": "Gesture Controlled Exo-Glove",
        "category": "ADVANCED KIT",
        "image": "https://images.unsplash.com/photo-1581092335397-9583fe92d232?auto=format&fit=crop&q=80&w=500",
        "description": "Wearable flex-sensor array with 2.4GHz RF transceiver modules for robotic frameworks.",
        "price": "₹3,899",
        "tags": ["Wearables", "RF Link", "Sensors"]
      }
    ];

    int crossAxisCount = 1;
    if (isDesktop) {
      crossAxisCount = 3;
    } else if (isTablet) {
      crossAxisCount = 2;
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 60.0 : (isTablet ? 32.0 : 16.0),
          vertical: 40.0,
        ),
        color: AppColor.background,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "PRE-ENGINEERED TRACKS",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Get Your Prototyping Hardware",
                  style: TextStyle(
                    color: AppColor.textPrimary,
                    fontSize: RFont.size(context, 24, tablet: 28, desktop: 32),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
              ],
            ),
            const SizedBox(height: 24),

            // Grid View Matrix with STRICT maximum height constraint
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                mainAxisExtent: 380, // Symmetrical dashboard bounding box limit
              ),
              itemBuilder: (context, index) {
                return _buildProductCard(context, products[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> prod) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.01),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Fixed Aspect Ratio Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: SizedBox(
              height: 140,
              width: double.infinity,
              child: Image.network(
                prod["image"],
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: const Color(0xFFF1F5F9),
                    child: const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary)),
                      ),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: const Color(0xFFF1F5F9),
                  child: const Icon(Icons.broken_image_outlined, color: Color(0xFF94A3B8), size: 28),
                ),
              ),
            ),
          ),

          // Content Box Container Panel
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
                      // Category Name
                      Text(
                        prod["category"],
                        style: const TextStyle(
                          color: AppColor.primary,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),

                      // Title
                      Text(
                        prod["title"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColor.textPrimary,
                          fontSize: RFont.size(context, 15, desktop: 16),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Description - Strict 2 lines restriction
                      Text(
                        prod["description"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12.5,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),

                  // Bottom Action Stack Anchored safely inside 380px bounds
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Chips Row
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: (prod["tags"] as List<String>).map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(fontSize: 10, color: Color(0xFF475569), fontWeight: FontWeight.w500),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 12),
                      const Divider(color: Color(0xFFF1F5F9), height: 1),
                      const SizedBox(height: 12),

                      // Price and Custom Inquiry Actions View
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "PRICE",
                                style: TextStyle(color: Colors.grey.shade500, fontSize: 9, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                prod["price"],
                                style: TextStyle(
                                  color: AppColor.textPrimary,
                                  fontSize: RFont.size(context, 16, desktop: 18),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          // FIXED: Action link mapping to triggered item map data model
                          ElevatedButton(
                            onPressed: () => _launchWhatsAppProduct(prod),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text(
                              "Inquiry Now",
                              style: TextStyle(color: AppColor.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
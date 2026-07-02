import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/responsive_font.dart';
import '../../../core/utils/screen_helper.dart';

class BuyNowScreen extends StatelessWidget {
  const BuyNowScreen({super.key});

  // Random robot/technology images from the web
  final List<String> _robotImages = const [
    'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1535378917042-10a22c95931a?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581091226033-d5c48150dbaa?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581092335871-4d0b2f678a5b?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1558346490-a72e53ae2d4f?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1535378917042-10a22c95931a?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581091226033-d5c48150dbaa?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581092918056-0c4c3acd3789?w=400&h=300&fit=crop',
    'https://images.unsplash.com/photo-1581092335871-4d0b2f678a5b?w=400&h=300&fit=crop',
  ];

  // Alternative: You can use these specific robot images instead
  // final List<String> _robotImages = const [
  //   'https://robohash.org/1?set=set2&size=400x300',
  //   'https://robohash.org/2?set=set2&size=400x300',
  //   'https://robohash.org/3?set=set2&size=400x300',
  //   'https://robohash.org/4?set=set2&size=400x300',
  //   'https://robohash.org/5?set=set2&size=400x300',
  //   'https://robohash.org/6?set=set2&size=400x300',
  // ];

  ///
  // Future<void> _launchWhatsAppProduct(Map<String, dynamic> prod) async {
  //   const String phoneNumber = "917370027802";
  //
  //   final String message =
  //       "Hello SK Robotics!\n\n"
  //       "I am interested in inquiring about the following hardware track:\n"
  //       "${prod["image"]}\n"
  //       "• Product: ${prod["title"]}\n"
  //       "• Track: ${prod["category"]}\n"
  //       "• Price Architecture: ${prod["price"]}\n\n"
  //       "Please provide details regarding module availability and sourcing setups.";
  //
  //   final Uri whatsappUri = Uri.parse(
  //     "https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}",
  //   );
  //
  //   if (await canLaunchUrl(whatsappUri)) {
  //     await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
  //   } else {
  //     debugPrint("Could not open specific product WhatsApp routing channel.");
  //   }
  // }

  Future<void> _launchWhatsAppProduct(Map<String, dynamic> prod) async {
    const String phoneNumber = "917370027802";

    // Ensure the image URL is clear and on its own line
    final String imageUrl = prod["image"];

    final String message =
        "Hello SK Robotics!\n\n"
        "I am interested in inquiring about the following hardware track:\n\n"
        "$imageUrl\n\n" // Image URL on its own line for better preview generation
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
        "title": "Blacklisted Vehicle Detection",
        "category": "Security System",
        "image": _robotImages[0],
        "description":
        "AI-powered vehicle detection system for identifying unauthorized or blacklisted vehicles with instant alerts.",
        "price": "₹3,999",
        "tags": ["ESP32-CAM", "RFID", "AI"]
      },
      {
        "title": "Access Control System",
        "category": "Security System",
        "image": _robotImages[1],
        "description":
        "RFID-based secure access control system for authorized entry and real-time monitoring.",
        "price": "₹2,499",
        "tags": ["ESP32", "RFID", "Security"]
      },
      {
        "title": "Home Access Control",
        "category": "Smart Home",
        "image": _robotImages[2],
        "description":
        "Smart RFID door access system for homes, apartments, and offices.",
        "price": "₹2,999",
        "tags": ["ESP32", "RFID", "Lock"]
      },
      {
        "title": "Face Recognition System",
        "category": "AI Security",
        "image": _robotImages[3],
        "description":
        "ESP32-CAM based facial recognition system for contactless identification and smart security.",
        "price": "₹3,499",
        "tags": ["ESP32-CAM", "AI", "Camera"]
      },
      {
        "title": "Smart Surveillance System",
        "category": "Security System",
        "image": _robotImages[4],
        "description":
        "Live video monitoring system with remote access and motion detection support.",
        "price": "₹4,999",
        "tags": ["ESP32-CAM", "Camera", "Wi-Fi"]
      },
      {
        "title": "Smart Fire Detection",
        "category": "Safety System",
        "image": _robotImages[5],
        "description":
        "Smart fire and smoke detection system with instant emergency alerts.",
        "price": "₹1,799",
        "tags": ["ESP32", "Flame", "MQ2"]
      },
      {
        "title": "Security Monitoring System",
        "category": "Security System",
        "image": _robotImages[6],
        "description":
        "Complete security monitoring solution with live alerts and remote surveillance.",
        "price": "₹4,499",
        "tags": ["ESP32", "ESP32-CAM", "PIR"]
      },
      {
        "title": "Smart Attendance System",
        "category": "Education Project",
        "image": _robotImages[7],
        "description":
        "Wi-Fi enabled digital attendance system with automatic record management.",
        "price": "₹2,499",
        "tags": ["ESP32", "Wi-Fi", "OLED"]
      },
      {
        "title": "RFID Attendance System",
        "category": "Education Project",
        "image": _robotImages[8],
        "description":
        "ESP32-based RFID attendance system for schools, colleges, and offices.",
        "price": "₹1,499",
        "tags": ["ESP32", "RFID", "Attendance"]
      },
      {
        "title": "Face Recognition Attendance",
        "category": "AI Education",
        "image": _robotImages[9],
        "description":
        "AI-powered attendance system using ESP32-CAM for contactless attendance.",
        "price": "₹3,499",
        "tags": ["ESP32-CAM", "AI", "Attendance"]
      },
      {
        "title": "Smart Library Management",
        "category": "Education Project",
        "image": _robotImages[10],
        "description":
        "RFID-based library management system for smart book issue and return.",
        "price": "₹2,499",
        "tags": ["ESP32", "RFID", "Library"]
      },
      {
        "title": "Smart Classroom Monitoring",
        "category": "Education Project",
        "image": _robotImages[11],
        "description":
        "IoT-based classroom monitoring system with environmental sensing.",
        "price": "₹2,499",
        "tags": ["ESP32", "DHT11", "PIR"]
      },
      {
        "title": "Smart Notice Board",
        "category": "Education Project",
        "image": _robotImages[0],
        "description":
        "Wireless digital notice board with real-time content updates.",
        "price": "₹1,999",
        "tags": ["ESP32", "Wi-Fi", "LED"]
      },
      {
        "title": "Digital Visitor Counter",
        "category": "Education Project",
        "image": _robotImages[1],
        "description":
        "Automatic people counting system with live visitor tracking.",
        "price": "₹1,199",
        "tags": ["ESP32", "IR", "OLED"]
      },
      {
        "title": "Smart Parking System",
        "category": "Smart City",
        "image": _robotImages[2],
        "description":
        "IoT-based parking management system with real-time slot detection.",
        "price": "₹1,999",
        "tags": ["ESP32", "Ultrasonic", "Servo"]
      },
      {
        "title": "Smart Traffic Control",
        "category": "Smart City",
        "image": _robotImages[3],
        "description":
        "Intelligent traffic signal control based on vehicle density detection.",
        "price": "₹3,499",
        "tags": ["ESP32", "IR", "Traffic"]
      },
      {
        "title": "Air Quality Monitoring",
        "category": "Smart City",
        "image": _robotImages[4],
        "description":
        "Real-time air pollution monitoring system using MQ135 sensor.",
        "price": "₹2,999",
        "tags": ["ESP32", "MQ135", "Wi-Fi"]
      },
      {
        "title": "Home Light Automation",
        "category": "Home Automation",
        "image": _robotImages[5],
        "description":
        "Control home lights remotely using Wi-Fi through a mobile app or web dashboard.",
        "price": "₹1,999",
        "tags": ["ESP32", "Wi-Fi", "Relay"]
      },
      {
        "title": "Smart Home Automation",
        "category": "Home Automation",
        "image": _robotImages[6],
        "description":
        "Complete home automation system for controlling electrical appliances remotely.",
        "price": "₹2,499",
        "tags": ["ESP32", "Automation", "IoT"]
      },
      {
        "title": "Water Level Monitoring",
        "category": "IoT Monitoring",
        "image": _robotImages[7],
        "description":
        "Smart system to monitor water tank levels and prevent overflow in real time.",
        "price": "₹1,299",
        "tags": ["ESP32", "Ultrasonic", "OLED"]
      },
      {
        "title": "Soil Moisture Detection",
        "category": "Smart Agriculture",
        "image": _robotImages[8],
        "description":
        "IoT-based soil moisture monitoring system for efficient irrigation management.",
        "price": "₹1,899",
        "tags": ["ESP32", "Soil Sensor", "OLED"]
      },
      {
        "title": "Smart Irrigation System",
        "category": "Smart Agriculture",
        "image": _robotImages[9],
        "description":
        "Automatic irrigation system that waters plants based on soil moisture levels.",
        "price": "₹2,499",
        "tags": ["ESP32", "Relay", "Water Pump"]
      },
      {
        "title": "Smart Solar Street Light",
        "category": "Green Energy",
        "image": _robotImages[10],
        "description":
        "Solar-powered street lighting system with automatic ON/OFF operation.",
        "price": "₹2,999",
        "tags": ["ESP32", "Solar", "LDR"]
      },
      {
        "title": "Sunlight Detection System",
        "category": "Environmental Monitoring",
        "image": _robotImages[11],
        "description":
        "Monitor sunlight intensity in real time for solar and agriculture applications.",
        "price": "₹1,499",
        "tags": ["ESP32", "LDR", "OLED"]
      },
      {
        "title": "Smart Energy Meter",
        "category": "Energy Monitoring",
        "image": _robotImages[0],
        "description":
        "Track electricity usage, power consumption, and energy costs in real time.",
        "price": "₹2,999",
        "tags": ["ESP32", "PZEM", "IoT"]
      },
      {
        "title": "Weather Monitoring Station",
        "category": "Environmental Monitoring",
        "image": _robotImages[1],
        "description":
        "Monitor temperature, humidity, and environmental conditions with live data.",
        "price": "₹2,999",
        "tags": ["ESP32", "DHT22", "BMP280"]
      },
      {
        "title": "Smart IoT Dashboard",
        "category": "IoT Platform",
        "image": _robotImages[2],
        "description":
        "Real-time dashboard for monitoring and controlling IoT devices remotely.",
        "price": "₹2,999",
        "tags": ["ESP32", "Dashboard", "Wi-Fi"]
      },
      {
        "title": "Water Quality Monitoring",
        "category": "IoT Monitoring",
        "image": _robotImages[3],
        "description":
        "Monitor water quality using pH and TDS sensors with real-time readings.",
        "price": "₹2,999",
        "tags": ["ESP32", "pH", "TDS"]
      },
      {
        "title": "Smart Dustbin Monitoring",
        "category": "Smart City",
        "image": _robotImages[4],
        "description":
        "IoT-based waste monitoring system with garbage level detection and alerts.",
        "price": "₹1,999",
        "tags": ["ESP32", "Ultrasonic", "IoT"]
      },
      {
        "title": "Smart Street Light",
        "category": "Smart City",
        "image": _robotImages[5],
        "description":
        "Automatic street lighting system with motion detection and energy saving.",
        "price": "₹2,299",
        "tags": ["ESP32", "PIR", "LDR"]
      },
      {
        "title": "Smart Toll Collection",
        "category": "RFID Automation",
        "image": _robotImages[6],
        "description":
        "RFID-based automated toll collection system for fast and secure vehicle access.",
        "price": "₹3,499",
        "tags": ["ESP32", "RFID", "Servo"]
      },
      {
        "title": "Smart Appliance Control",
        "category": "Home Automation",
        "image": _robotImages[7],
        "description":
        "Wi-Fi enabled system for controlling home and office appliances remotely.",
        "price": "₹2,499",
        "tags": ["ESP32", "Wi-Fi", "Relay"]
      },
      {
        "title": "SARATHI Robot",
        "category": "AI Security Robot",
        "image": _robotImages[8],
        "description":
        "ESP32-based autonomous security robot with obstacle avoidance, gas detection, cliff protection, Wi-Fi dashboard, Bluetooth voice control, and OLED live monitoring.",
        "price": "Custom Quote",
        "tags": ["ESP32", "AI", "Security"]
      },
      {
        "title": "ECO NAVIGATOR PRO",
        "category": "Green Robotics",
        "image": _robotImages[9],
        "description":
        "AI-powered solar environmental navigation robot featuring autonomous navigation, solar charging, environmental monitoring, Wi-Fi dashboard, and OLED live telemetry.",
        "price": "Custom Quote",
        "tags": ["Solar", "ESP32", "AI"]
      },
      {
        "title": "Line Follower Robot",
        "category": "ROBOTICS KIT",
        "image": _robotImages[10],
        "description":
        "ESP32 based robot that follows a predefined path using IR sensors. Perfect for learning and competitions.",
        "price": "₹1,499",
        "tags": ["ESP32", "IR Sensor", "L298N"]
      },
      {
        "title": "Obstacle Avoiding Robot",
        "category": "ROBOTICS KIT",
        "image": _robotImages[11],
        "description":
        "Intelligent robot that detects obstacles using ultrasonic sensor and changes direction automatically.",
        "price": "₹1,799",
        "tags": ["ESP32", "Ultrasonic", "L298N"]
      },
      {
        "title": "Bluetooth Controlled Robot",
        "category": "CONNECTIVITY KIT",
        "image": _robotImages[0],
        "description":
        "Smartphone controlled robot using Bluetooth connectivity for wireless operation and smooth movement.",
        "price": "₹1,999",
        "tags": ["ESP32", "Bluetooth", "L298N"]
      },
      {
        "title": "Voice Controlled Robot",
        "category": "AI & CONTROL KIT",
        "image": _robotImages[1],
        "description":
        "Responds to voice commands via mobile app. An interactive robot for smart and hands-free control.",
        "price": "₹2,999",
        "tags": ["ESP32", "Bluetooth", "Voice Module"]
      },
      {
        "title": "Gesture Controlled Robot",
        "category": "ADVANCED KIT",
        "image": _robotImages[2],
        "description":
        "Control the robot using hand gestures with MPU6050 sensor. Wireless and highly responsive.",
        "price": "₹2,999",
        "tags": ["ESP32", "MPU6050", "NRF24L01"]
      },
      {
        "title": "Fire Fighting Robot",
        "category": "SPECIALIZED KIT",
        "image": _robotImages[3],
        "description":
        "Detects fire using flame sensor and automatically sprays water to extinguish the fire.",
        "price": "₹3,499",
        "tags": ["ESP32", "Flame Sensor", "Water Pump"]
      },
      {
        "title": "Eco-Friendly Cleaning Robot",
        "category": "UTILITY KIT",
        "image": _robotImages[4],
        "description":
        "Collects small waste and promotes clean environment. A smart step towards hygiene and automation.",
        "price": "₹2,499",
        "tags": ["ESP32", "Ultrasonic", "DC Motors"]
      },
      {
        "title": "Smart Security Patrol Robot",
        "category": "SECURITY KIT",
        "image": _robotImages[5],
        "description":
        "Patrolling robot with live monitoring, obstacle detection and remote control for security applications.",
        "price": "₹3,499",
        "tags": ["ESP32-CAM", "Ultrasonic", "L298N"]
      },
      {
        "title": "Surveillance Robot",
        "category": "SURVEILLANCE KIT",
        "image": _robotImages[6],
        "description":
        "Live video streaming robot using ESP32-CAM for remote monitoring and real-time surveillance.",
        "price": "₹4,999",
        "tags": ["ESP32-CAM", "Wi-Fi", "L298N"]
      },
      {
        "title": "Wi-Fi Controlled Robot",
        "category": "CONNECTIVITY KIT",
        "image": _robotImages[7],
        "description":
        "Control the robot over Wi-Fi using web interface or mobile device from anywhere.",
        "price": "₹2,499",
        "tags": ["ESP32", "Wi-Fi", "L298N"]
      }
    ];

    int crossAxisCount = 2;
    if (isDesktop) {
      crossAxisCount = 4;
    } else if (isTablet) {
      crossAxisCount = 3;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset('assets/service/buy-now-banner.jpeg',fit: BoxFit.contain,),
          Container(
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

                // Grid View Matrix
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 380,
                  ),
                  itemBuilder: (context, index) {
                    return _buildProductCard(context, products[index]);
                  },
                ),
              ],
            ),
          ),
        ],
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
          // Fixed Aspect Ratio Image with Network Image
          Expanded(
            child: ClipRRect(
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.image_not_supported_outlined,
                          color: Color(0xFF94A3B8),
                          size: 32,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Image not available',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content Box Container Panel
          Padding(
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

                const SizedBox(height: 12),

                // Bottom Action Stack
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
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
                              style: TextStyle(
                                color: Colors.green.shade700,
                                fontSize: 9,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              prod["price"],
                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: RFont.size(context, 14, tablet: 16,desktop: 18),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),

                        // WhatsApp Inquiry Button
                        ElevatedButton.icon(
                          onPressed: () => _launchWhatsAppProduct(prod),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          label: Text(
                            "Inquiry Now",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w700,
                              fontSize: RFont.size(context, 12, tablet: 12,desktop: 12),
                            ),
                          ),
                          icon: const FaIcon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
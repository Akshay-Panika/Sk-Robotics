import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/utils/app_color.dart';
import '../../../core/utils/screen_helper.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  int _selectedIndex = 0;
  bool _isBioExpanded = false; // Bio toggle status handle karne ke liye state variable

  final List<Map<String, String>> steps = [
    {
      "title": "IOT Development",
      "introduction": "Connecting hardware components and microcontrollers to the internet to read ambient sensors, capture environmental datasets, and relay network telemetry data.",
      "example": "1. Deploying an MQ2 Gas Sensor and DHT11 module on an ESP32 node.\n2. Reading raw analog air quality indices dynamically.\n3. Streaming live telemetry data via lightweight MQTT protocol channels.",
      "image": "https://picsum.photos/400/300?random=1"
    },
    {
      "title": "Robotic Development",
      "introduction": "Programming autonomous kinematic devices using embedded logic blocks, spatial mapping engines, and multi-axis hardware motion coordination frameworks.",
      "example": "1. Calculating real-time Inverse Kinematics structural vectors.\n2. Controlling multi-axis motion paths for a 3-Axis robotic arm.\n3. Driving precise mechanics via PCA9685 PWM multi-servo hardware modules.",
      "image": "https://picsum.photos/400/300?random=2"
    },
    {
      "title": "Smart Automation",
      "introduction": "Writing low-latency microcontroller application code to trigger structural event loops, manage thread scheduling, and automate connected edge behaviors.",
      "example": "1. Allocating dynamic concurrent tasks inside FreeRTOS firmware kernels.\n2. Monitoring continuous environmental thresholds in real time.\n3. Instantly switching high-voltage AC relays when values drop below 20%.",
      "image": "https://picsum.photos/400/300?random=3"
    },
    {
      "title": "Security Systems",
      "introduction": "Enforcing ironclad hardware access control barriers through encrypted entry records, cryptographic handshake loops, and structural biometric authentications.",
      "example": "1. Interfacing an RC522 RFID reader with secure validation lookup arrays.\n2. Detecting structural physical chassis bypass or direct terminal access breaks.\n3. Dispatching encrypted Firebase alerts to remote monitoring clients instantly.",
      "image": "https://picsum.photos/400/300?random=4"
    },
    {
      "title": "Dashboard Development",
      "introduction": "Architecting modern analytical frontend platforms to aggregate raw inbound device payloads into intuitive charts and real-time operations interfaces.",
      "example": "1. Opening robust, persistent full-duplex WebSockets network streams.\n2. Compiling asynchronous payload fragments into reactive state managers.\n3. Populating high-contrast charts with real-time edge network telemetry metrics.",
      "image": "https://picsum.photos/400/300?random=5"
    },
    {
      "title": "Fail-Safe System Design",
      "introduction": "Engineering redundant execution boundaries and continuous hardware loops to preserve strict system availability and handle unexpected software runtime hangs.",
      "example": "1. Activating system hardware Watchdog Timers (WDT) countdown resets.\n2. Deploying auxiliary isolated solid-state backup battery circuits.\n3. Triggering automated hard reboots to guarantee continuous 24/7 uptime.",
      "image": "https://picsum.photos/400/300?random=6"
    },
  ];

  final List<String> _EMHA = [
    "ESP32", "ESP8266", "Arduino", "RFID", "OLED Display",
    "Sensors", "Servos", "Motors", "Motor Drivers", "Power Management", "Local Systems"
  ];

  final List<Map<String, dynamic>> _COMMTECH = [
    {"name": "Wi-Fi", "icon": FontAwesomeIcons.wifi},
    {"name": "Bluetooth", "icon": FontAwesomeIcons.bluetooth},
    {"name": "RFID", "icon": FontAwesomeIcons.idCard},
    {"name": "IR-Comm", "icon": FontAwesomeIcons.rss},
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final bool isDesktop = ScreenHelper.isDesktop(context);
      final bool isTablet = ScreenHelper.isTablet(context);

      // Bio Description Data Strings Split Setup
      const String baseBio = "Passionate IoT & Robotics Developer with hands-on experience in designing intelligent embedded systems, autonomous robots, smart automation platforms, security systems and real-time monitoring solutions.";
      const String dynamicExtendedBio = " Specialized in building production-grade architecture using ESP32/ESP8266 nodes, seamless industrial sensor integration, and efficient micro-firmware optimization. Experienced in deploying low-latency communication networks via MQTT, HTTP, and WebSockets protocols, bridging hardware telemetry directly with real-time reactive dashboards. Driven by creating fail-safe automated environments and scalable edge-computing software frameworks.";

      return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 60.0 : (isTablet ? 32.0 : 16.0),
          vertical: 24.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= Header Profile Segment =================
            const Text(
              "About Me",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: Color(0xFF0D0D0D)),
            ),
            const SizedBox(height: 4),
            Container(height: 4, width: 150, color: AppColor.primary),
            const SizedBox(height: 20),
            const Text(
              "Developing Intelligent IoT, Robotics & Automation Solutions for Real-World Applications",
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, height: 1.3),
            ),
            const SizedBox(height: 12),

            // RichText with inline clickable action handler for Read More / Less
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(fontSize: 14.5, color: Colors.grey.shade700, height: 1.6, fontFamily: 'sans-serif'),
                children: [
                  const TextSpan(text: baseBio),
                  TextSpan(text: _isBioExpanded ? dynamicExtendedBio : "... "),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: GestureDetector(
                      onTap: () => setState(() => _isBioExpanded = !_isBioExpanded),
                      child: Text(
                        _isBioExpanded ? " Read Less" : "Read More",
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),

            // ================= Dynamic Split Screen System =================
            if (isDesktop)
              _buildDesktopSplitLayout()
            else
              _buildMobileStackLayout(),

            const Divider(height: 40, thickness: 1),

            // ================= Tech Specifications Footer (Highly Space Optimized) =================
            const Text("Embedded And Hardware", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            _buildOptimizedHardwareWrap(),

            const SizedBox(height: 30),
            const Text("Communication Tech", style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            _buildCommunicationChips(),
            const SizedBox(height: 20),
          ],
        ),
      );
    });
  }

  // Interactive Desktop Split System
  Widget _buildDesktopSplitLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs Left Column
        Expanded(
          flex: 2,
          child: Column(
            children: List.generate(steps.length, (index) {
              final bool isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? AppColor.primary.withOpacity(0.3) : Colors.transparent,
                    ),
                    boxShadow: isSelected
                        ? [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, offset: const Offset(0, 3))]
                        : [],
                  ),
                  child: Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 4,
                        height: 24,
                        decoration: BoxDecoration(
                          color: isSelected ? AppColor.primary : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(width: isSelected ? 12 : 4),
                      Expanded(
                        child: Text(
                          steps[index]["title"]!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? AppColor.primary : Colors.black87,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: isSelected ? AppColor.primary : Colors.grey.shade400,
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(width: 40),

        // Right Network Viewer Dashboard Engine
        Expanded(
          flex: 3,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Container(
              key: ValueKey<int>(_selectedIndex),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey.shade100),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container( height: 240,child: Center(child: Icon(Icons.image_not_supported_outlined,size: 100,color: Colors.grey.shade300,)),),
                  const SizedBox(height: 20),
                  Text(
                    steps[_selectedIndex]["title"]!,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    steps[_selectedIndex]["introduction"]!,
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade600, height: 1.5),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade100),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Execution Matrix Configuration:",
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.primary, letterSpacing: 0.5),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          steps[_selectedIndex]["example"]!,
                          style: TextStyle(fontSize: 14, color: Colors.grey.shade800, height: 1.6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Mobile/Tablet Horizontal Tab Strip Controller Layout
  Widget _buildMobileStackLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: List.generate(steps.length, (index) {
              final bool isSelected = _selectedIndex == index;
              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: Container(
                  margin: const EdgeInsets.only(right: 10, bottom: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColor.primary : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: AppColor.primary,
                    ),
                  ),
                  child: Text(
                    steps[index]["title"]!,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 12, offset: const Offset(0, 4))],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container( height: 180,child: Center(child: Icon(Icons.image_not_supported_outlined,size: 100,color: Colors.grey.shade300,)),),
              const SizedBox(height: 16),
              Text(
                steps[_selectedIndex]["title"]!,
                style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                steps[_selectedIndex]["introduction"]!,
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600, height: 1.4),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200, width: 0.5),
                ),
                child: Text(
                  steps[_selectedIndex]["example"]!,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade800, height: 1.5),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // FIXED & OPTIMIZED: GridView replaced with clean modern compact dynamic chips wrap
  Widget _buildOptimizedHardwareWrap() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(_EMHA.length, (idx) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade200, width: 0.5),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, size: 14, color: AppColor.primary),
              const SizedBox(width: 8),
              Text(
                _EMHA[idx],
                style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w500, color: Colors.black87),
              ),
            ],
          ),
        );
      }),
    );
  }

  // Communication Capsules List segment
  Widget _buildCommunicationChips() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(_COMMTECH.length, (idx) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(_COMMTECH[idx]["icon"], size: 13, color: AppColor.primary),
              const SizedBox(width: 10),
              Text(
                _COMMTECH[idx]["name"],
                style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: Colors.black87),
              ),
            ],
          ),
        );
      }),
    );
  }
}
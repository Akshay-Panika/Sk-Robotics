import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/responsive_font.dart'; // Using your requested RFont import path
import '../../../core/utils/screen_helper.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);
    final bool isTablet = ScreenHelper.isTablet(context);

    final double horizontalPadding = isDesktop ? 60.0 : (isTablet ? 32.0 : 20.0);
    final double verticalPadding = isDesktop ? 35.0 : 25.0;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      decoration: const BoxDecoration(
        color: AppColor.background, // FIXED: Changed from AppColor.white to AppColor.background
        border: Border(
          top: BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      child: Column(
        children: [
          // Main Footer Content
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 2, child: _buildBrandInfo(context)),
                const SizedBox(width: 40),
                Expanded(child: _buildLinksColumn(context, "IoT & Robotics Services", ["Custom Firmware", "ROS Drone Solutions", "Smart Automation", "PCB Prototyping"])),
                Expanded(child: _buildLinksColumn(context, "Hardware Labs", ["ESP32 / STM32 Nodes", "Kinematic Robotics", "Edge AI Systems", "Sensor Fusion"])),
                Expanded(child: _buildContactColumn(context)),
              ],
            )
          else ...[
            _buildBrandInfo(context),
            const SizedBox(height: 28),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildLinksColumn(context, "Services", ["Custom Firmware", "ROS Solutions", "Automation"])),
                Expanded(child: _buildLinksColumn(context, "Labs", ["Microcontrollers", "Robotics", "Edge AI"])),
              ],
            ),
            const SizedBox(height: 24),
            _buildContactColumn(context),
          ],

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(height: 1, thickness: 1, color: Color(0xFFE2E8F0)),
          ),

          // Bottom Bar Copyright and Icons
          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: isDesktop ? CrossAxisAlignment.center : CrossAxisAlignment.center,
            children: [
              Text(
                "© 2026 SK Robotics. All rights reserved.",
                style: TextStyle(
                  fontSize: RFont.size(context, 12, desktop: 13),
                  color: AppColor.textPrimary.withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                ),
              ),
              if (!isDesktop) const SizedBox(height: 12),
              _buildSocialRow(),
            ],
          ),
        ],
      ),
    );
  }

  // Left Brand Identity Area
  Widget _buildBrandInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.precision_manufacturing_outlined, color: AppColor.primary, size: 18),
            ),
            const SizedBox(width: 8),
            const Text(
              "SK Robotics",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColor.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 300,
          child: Text(
            "Building robust industrial IoT systems, low-latency firmware setups, and state-of-the-art multi-axis autonomous robots.",
            style: TextStyle(
              fontSize: RFont.size(context, 12.5, desktop: 13),
              color: AppColor.textPrimary.withOpacity(0.7),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  // Links System
  Widget _buildLinksColumn(BuildContext context, String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: Text(
                link,
                style: TextStyle(
                  fontSize: RFont.size(context, 12.5, desktop: 13),
                  color: AppColor.textPrimary.withOpacity(0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }

  // Specialized Engineering Support Contact Column
  Widget _buildContactColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Engineering Support",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.textPrimary),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Icon(Icons.terminal_rounded, size: 14, color: AppColor.secondary),
            const SizedBox(width: 8),
            Text(
              "projects@skrobotics.com",
              style: TextStyle(
                fontSize: RFont.size(context, 12.5, desktop: 13),
                color: AppColor.textPrimary.withOpacity(0.7),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.developer_board, size: 14, color: AppColor.primary),
            const SizedBox(width: 8),
            Text(
              "Hardware Lab, India",
              style: TextStyle(
                fontSize: RFont.size(context, 12.5, desktop: 13),
                color: AppColor.textPrimary.withOpacity(0.7),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Footer Social Media Elements Bar
  Widget _buildSocialRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildIconLink(Icons.memory_rounded),
        const SizedBox(width: 12),
        _buildIconLink(Icons.lan_outlined),
        const SizedBox(width: 12),
        _buildIconLink(Icons.settings_remote_outlined),
      ],
    );
  }

  Widget _buildIconLink(IconData icon) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.white, // Enhanced contrast over background color
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Icon(icon, size: 14, color: AppColor.textPrimary.withOpacity(0.8)),
        ),
      ),
    );
  }
}
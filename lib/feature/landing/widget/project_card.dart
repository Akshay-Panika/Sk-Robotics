import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final bool? showShadow;

  const ProjectCard({
    super.key,
    this.showShadow, // Default true rakha hai
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 16,
      children: [
        _buildMetricCard(15, "Projects"),
        _buildMetricCard(5, "Robotics"),
        _buildMetricCard(10, "IoT Solutions"),
        _buildMetricCard(20, "Embedded Prototypes"),
      ],
    );
  }

  Widget _buildMetricCard(int targetValue, String label) {
    return Container(
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: showShadow == true ? Colors.grey.shade300: Colors.transparent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TweenAnimationBuilder<int>(
            tween: IntTween(begin: 0, end: targetValue),
            duration: const Duration(milliseconds: 2500),
            curve: Curves.easeOutQuad,
            builder: (context, value, child) {
              return Text(
                "$value+",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E293B),
                ),
              );
            },
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
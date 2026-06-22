import 'package:flutter/material.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/responsive_font.dart';
import '../../../core/utils/screen_helper.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(ScreenHelper.isDesktop(context)){
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 50,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Services",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0D0D0D),
                  letterSpacing: -0.5,
                ),
              ),
              Container(height: 5,width: 200,color: AppColor.primary,),
              const SizedBox(height: 28),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Left Content
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "A Complete Platform For",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Smart IoT And Robotics",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "Manage custom hardware, automated processes, dashboard monitoring and prototype tracking with a complete digital platform.",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade700,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 40),

                  /// Top Right Cards
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: const [
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.admin_panel_settings,
                            title: "IoT & Automation",
                            description:
                            "Smart automation system development customized web dashboard solutions embedded device controller firmware design protocols...",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.person,
                            title: "Robotics Systems",
                            description:
                            "Autonomous navigation mobile robot design sensor integrated feedback controls hardware prototyping testing",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// Bottom Cards
              Row(
                children: const [
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.phone_android,
                      title: "Smart Sensors",
                      description:
                      "Environmental data logger ambient tracking system industrial sensor alert real-time metrics dashboards",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.language,
                      title: "Embedded Web Solutions",
                      description:
                      "Firebase Hosting integration custom local networks responsive frontend interface",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.business,
                      title: "Firmware",
                      description:
                      "Program microcontrollers and optimize operations.",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.event,
                      title: "Hardware Setup",
                      description:
                      "Configure circuits and microchips.",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.groups,
                      title: "Custom UI",
                      description:
                      "Design clean screens for management.",
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }
      if(ScreenHelper.isTablet(context)){
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Services",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0D0D0D),
                  letterSpacing: -0.5,
                ),
              ),
              Container(height: 5,width: 100,color: AppColor.primary,),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Left Content
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          "A Complete Platform For",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Smart IoT And Robotics",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Manage custom hardware, automated processes, dashboard monitoring and prototype tracking with a complete digital platform.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            height: 1.6,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  /// Top Right Cards
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: const [
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.admin_panel_settings,
                            title: "IoT & Automation",
                            description:
                            "Smart automation system development customized web dashboard solutions embedded device controller firmware design protocols...",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ServiceCard(
                            icon: Icons.person,
                            title: "Robotics Systems",
                            description:
                            "Autonomous navigation mobile robot design sensor integrated feedback controls hardware prototyping testing",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Bottom Cards
              Row(
                children: const [
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.phone_android,
                      title: "Smart Sensors",
                      description:
                      "Environmental data logger ambient tracking system industrial sensor alert real-time metrics dashboards",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.language,
                      title: "Embedded Web Solutions",
                      description:
                      "Firebase Hosting integration custom local networks responsive frontend interface",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.business,
                      title: "Firmware",
                      description:
                      "Program microcontrollers and optimize operations.",
                    ),
                  ),
                  // FIX: removed a stray trailing `SizedBox(width: 20)` that
                  // used to sit here with nothing after it. It had no
                  // matching Expanded on its right, so it just ate 20px of
                  // width and made these 3 cards slightly narrower/uneven
                  // compared to every other row in this file.
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ServiceCard(
                        icon: Icons.event,
                        title: "Hardware Setup",
                        description:
                        "Configure circuits and microchips."
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      icon: Icons.groups,
                      title: "Custom UI",
                      description:
                      "Design clean screens for management.",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(child: SizedBox()),
                ],
              )
            ],
          ),
        );
      }

      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Services",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Color(0xFF0D0D0D),
                letterSpacing: -0.5,
              ),
            ),
            Container(height: 5,width: 100,color: AppColor.primary,),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                Text(
                  "A Complete Platform For",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Smart IoT And Robotics",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Manage custom hardware, automated processes, dashboard monitoring and prototype tracking with a complete digital platform.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.6,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: const [
                Expanded(
                  child: ServiceCard(
                      icon: Icons.admin_panel_settings,
                      title: "IoT & Automation",
                      description:
                      "Smart automation system development customized web dashboard solutions embedded device controller firmware design protocols..."
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ServiceCard(
                      icon: Icons.person,
                      title: "Robotics Systems",
                      description:
                      "Autonomous navigation mobile robot design sensor integrated feedback controls hardware prototyping testing"
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Bottom Cards
            Row(
              children: const [
                Expanded(
                  child: ServiceCard(
                      icon: Icons.phone_android,
                      title: "Smart Sensors",
                      description:
                      "Environmental data logger ambient tracking system industrial sensor alert real-time metrics dashboards"
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ServiceCard(
                      icon: Icons.language,
                      title: "Embedded Web Solutions",
                      description:
                      "Firebase Hosting integration custom local networks responsive frontend interface"
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ServiceCard(
                    icon: Icons.business,
                    title: "Firmware",
                    description:
                    "Program microcontrollers and optimize operations.",
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ServiceCard(
                    icon: Icons.event,
                    title: "Hardware Setup",
                    description:
                    "Configure circuits and microchips.",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: ServiceCard(
                    icon: Icons.groups,
                    title: "Custom UI",
                    description:
                    "Design clean screens for management.",
                  ),
                ),
                SizedBox(width: 20),
                Expanded(child: SizedBox()),

              ],
            )
          ],
        ),
      );
    },);
  }
}

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    // FIX: previously every dimension here (card height, icon size,
    // icon-box padding, title font) was a fixed constant regardless of
    // screen size — only the description font used RFont.size(). That
    // meant a mobile card squeezed into half of a narrow Row still
    // forced the same 200px height and 20px icon as a wide desktop
    // card. Now height/icon scale down a step per breakpoint too, so
    // the whole card feels proportional, not just its description text.
    final double cardHeight = ScreenHelper.isDesktop(context)
        ? 200
        : ScreenHelper.isTablet(context)
        ? 190
        : 170;
    final double iconBoxPadding = ScreenHelper.isDesktop(context) ? 15 : 12;
    final double iconSize = ScreenHelper.isDesktop(context) ? 20 : 18;

    return Container(
      height: cardHeight,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: AppColor.primary,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(iconBoxPadding),
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColor.primary,
              size: iconSize,
            ),
          ),
          const SizedBox(height: 25),
          // FIX: added maxLines/overflow here. A longer title like
          // "Embedded Web Solutions" could previously wrap to 2 lines on
          // a narrow mobile card and eat into the description's space
          // unevenly compared to shorter titles like "Firmware". Capping
          // to 1 line keeps every card's title block the same height.
          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: RFont.size(context, 13, tablet: 14, desktop: 14),
              color: AppColor.secondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style:  TextStyle(
                fontSize: RFont.size(context, 12,tablet: 14,desktop: 14),
                color: Colors.grey.shade700,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
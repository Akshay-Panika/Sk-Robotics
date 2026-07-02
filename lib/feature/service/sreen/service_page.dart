import 'package:flutter/material.dart';
import 'package:sk_robotics/feature/service/sreen/show_service_details.dart';
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
                          "Innovative IoT, Robotics & Automation Solutions",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          "We provide smart technology solutions using IoT, Robotics, Embedded Systems, Automation, and Web Technologies. Our goal is to develop reliable, efficient, and user-friendly systems that solve real-world problems.",
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
                            image: "assets/service/iot.jpeg",
                            title: "IoT Development",
                            description:
                            "Smart automation system development customized web dashboard solutions embedded device controller firmware design protocols...",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ServiceCard(
                            image: "assets/service/robo.jpeg",
                            title: "Robotics Development",
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
                      image: "assets/service/automation.jpeg",
                      title: "Smart Automation",
                      description: "Environmental data logger ambient tracking system industrial sensor alert real-time metrics dashboards",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      image: "assets/service/embedded.jpeg",
                      title: "Embedded System Development",
                      description:
                      "Firebase Hosting integration custom local networks responsive frontend interface",
                    ),
                  ),
                  SizedBox(width: 20),

                  Expanded(
                    child: ServiceCard(
                      image: "assets/service/fail-safe.jpeg",
                      title: "Fail-Safe System Design",
                      description:
                      "Program microcontrollers and optimize operations.",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      image: "assets/service/innovation.jpeg",
                      title: "Innovation",
                      description:
                      "Configure circuits and microchips.",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      image: "assets/service/dashboard.jpeg",
                      title: "Dashboard",
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
                          "Innovative IoT, Robotics & Automation Solutions",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColor.primary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "We provide smart technology solutions using IoT, Robotics, Embedded Systems, Automation, and Web Technologies. Our goal is to develop reliable, efficient, and user-friendly systems that solve real-world problems.",
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
                            image: "assets/service/iot.jpeg",
                            title: "IoT Development",
                            description:
                            "Smart automation system development customized web dashboard solutions embedded device controller firmware design protocols...",
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: ServiceCard(
                            image: "assets/service/robo.jpeg",
                            title: "Robotics Development",
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
                      image: "assets/service/automation.jpeg",
                      title: "Smart Automation",
                      description:
                      "Environmental data logger ambient tracking system industrial sensor alert real-time metrics dashboards",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      image: "assets/service/embedded.jpeg",
                      title: "Embedded System Development",
                      description:
                      "Firebase Hosting integration custom local networks responsive frontend interface",
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      image: "assets/service/fail-safe.jpeg",
                      title: "Fail-Safe System Design",
                      description:
                      "Program microcontrollers and optimize operations.",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ServiceCard(
                        image: "assets/service/innovation.jpeg",
                        title: "Innovation",
                        description:
                        "Configure circuits and microchips."
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: ServiceCard(
                      image: "assets/service/dashboard.jpeg",
                      title: "Dashboard",
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
          horizontal: 20,
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
                  "Innovative IoT, Robotics & Automation Solutions",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "We provide smart technology solutions using IoT, Robotics, Embedded Systems, Automation, and Web Technologies. Our goal is to develop reliable, efficient, and user-friendly systems that solve real-world problems.",
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
                      image: "assets/service/iot.jpeg",
                      title: "IoT Development",
                      description:
                      "Smart automation system development customized web dashboard solutions embedded device controller firmware design protocols..."
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ServiceCard(
                      image: "assets/service/robo.jpeg",
                      title: "Robotics Development",
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
                      image: "assets/service/automation.jpeg",
                      title: "Smart Automation",
                      description:
                      "Environmental data logger ambient tracking system industrial sensor alert real-time metrics dashboards"
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ServiceCard(
                      image: "assets/service/embedded.jpeg",
                      title: "Embedded System Development",
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
                    image: "assets/service/fail-safe.jpeg",
                    title: "Fail-Safe System Design",
                    description:
                    "Program microcontrollers and optimize operations.",
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ServiceCard(
                    image: "assets/service/innovation.jpeg",
                    title: "Innovation",
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
                    image: "assets/service/dashboard.jpeg",
                    title: "Dashboard",
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
  final String image;
  final String title;
  final String description;

  const ServiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final double cardHeight = ScreenHelper.isDesktop(context) ? 200
        : ScreenHelper.isTablet(context) ? 190 : 170;
    final double iconBoxPadding = ScreenHelper.isDesktop(context) ? 15 : 12;
    return InkWell(
      onTap: () {
        showServiceDetails(context, title, image);
      },
      child: Container(
        height: cardHeight,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: AppColor.primary,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          // alignment: Alignment.bottomCenter,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(iconBoxPadding),
                decoration: BoxDecoration(
                  color: AppColor.primary.withOpacity(.09),
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: RFont.size(context, 13, tablet: 14, desktop: 14),
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
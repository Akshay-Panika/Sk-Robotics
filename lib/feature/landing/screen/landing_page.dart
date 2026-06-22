import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/utils/app_color.dart';
import '../../../core/utils/screen_helper.dart';
import '../widget/project_card.dart';
import '../widget/responsive_carousel.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  // Global WhatsApp Channel Query Method
  Future<void> _launchWhatsApp() async {
    const String phoneNumber = "917370027802";
    const String message = "Hello SK Robotics! I visited your platform and want to join/inquire about ongoing smart hardware development and prototyping tracks.";
    final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not open WhatsApp channel.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if(ScreenHelper.isDesktop(context)){
        return Container(
          // margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          decoration:  BoxDecoration(
            color: AppColor.white,
          ),
          child: Stack(
            children: [
              /// Blue diagonal left panel
              ClipPath(
                clipper: DiagonalClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.62,
                  height: 500,
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                        AssetImage('assets/image/bg-img.jpg'),opacity: 0.6),
                    gradient: LinearGradient(
                      colors: [
                        AppColor.primary,
                        AppColor.primary.withOpacity(.3),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 50,),
                      const Text(
                        "ER. Shivam Kumar Singh",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),

                      /// Underline accent
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        height: 3,
                        width: 400,
                        color: Colors.white,
                      ),

                      const Text(
                        "IoT System Developer | Robotics Developer | Embedded System Innovator",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Passionate about designing and developing intelligent IoT and Robotics solutions that solve\nreal-world problems through innovation, automation and real-time monitoring.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 50),

                      Row(
                        children: [
                          /// Join Now - white outlined button
                          OutlinedButton.icon(
                            onPressed: _launchWhatsApp, // Wired Action
                            icon: FaIcon(FontAwesomeIcons.whatsapp,
                                color: AppColor.primary, size: 18),
                            label: const Text(
                              "Join Now",
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          /// View Demo - blue filled button
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.video_camera_back_outlined,
                                color: Colors.white, size: 18),
                            label: const Text(
                              "View Demo",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              side: const BorderSide(color: Colors.white54),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Right Side Illustration
              Positioned(
                right: 40,
                top: 20,
                bottom: 20,
                width: MediaQuery.of(context).size.width * 0.42,
                child: const ResponsiveCarousel(),
              ),

              /// "Upcoming Features" vertical text on far right
              Positioned(
                right: 10,
                top: 0,
                bottom: 0,
                child: Center(
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "My Achievement",
                      style: TextStyle(
                        color: Colors.red.shade400,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(),
                  SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:ProjectCard(),
                  ),
                ],
              ),
            ],
          ),
        );
      }

      if(ScreenHelper.isTablet(context)){
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Expanded(flex: 2,
                  child: Container(
                    padding: const EdgeInsets.all(50),
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image:
                          AssetImage('assets/image/bg-img.jpg'),opacity: 0.6),
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primary,
                          AppColor.primary.withOpacity(.3),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "ER. Shivam Kumar Singh",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),

                        /// Underline accent
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          height: 3,
                          width: 300,
                          color: Colors.white,
                        ),

                        const Text(
                          "IoT System Developer | Robotics Developer | Embedded System Innovator",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const Text(
                          "Passionate about designing and developing intelligent IoT and Robotics solutions that solve\nreal-world problems through innovation, automation and real-time monitoring.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 30),

                        Row(
                          children: [
                            /// Join Now - white outlined button
                            OutlinedButton.icon(
                              onPressed: _launchWhatsApp, // Wired Action
                              icon: FaIcon(FontAwesomeIcons.whatsapp,
                                  color: AppColor.primary, size: 18),
                              label: const Text(
                                "Join Now",
                                style: TextStyle(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),

                            const SizedBox(width: 16),

                            /// View Demo - blue filled button
                            ElevatedButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.video_camera_back_outlined,
                                  color: Colors.white, size: 18),
                              label: const Text(
                                "View Demo",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primary,
                                side: const BorderSide(color: Colors.white54),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox())
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 300,
                    child: const ResponsiveCarousel()),
                const SizedBox(height: 20,)
              ],
            )
          ],
        );
      }

      // Mobile Variant Layout
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image:
                        AssetImage('assets/image/bg-img.jpg'),opacity: 0.6),
                    gradient: LinearGradient(
                      colors: [
                        AppColor.primary,
                        AppColor.primary.withOpacity(.3),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "ER. Shivam Kumar Singh",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                      ),

                      /// Underline accent
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        height: 2,
                        width: 250,
                        color: Colors.white,
                      ),

                      const Text(
                        "IoT System Developer | Robotics Developer | Embedded System Innovator",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Passionate about designing and developing intelligent IoT and Robotics solutions that solve\nreal-world problems through innovation, automation and real-time monitoring.",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.6,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          /// Join Now - white outlined button
                          OutlinedButton.icon(
                            onPressed: _launchWhatsApp, // Wired Action
                            icon: FaIcon(FontAwesomeIcons.whatsapp,
                                color: AppColor.primary, size: 18),
                            label: const Text(
                              "Join Now",
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.white),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),

                          /// View Demo - blue filled button
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.video_camera_back_outlined,
                                color: Colors.white, size: 18),
                            label: const Text(
                              "View Demo",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
                              side: const BorderSide(color: Colors.white54),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28,
                                vertical: 16,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox())
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 300,
                  child: const ResponsiveCarousel()),
              const SizedBox(height: 20,)
            ],
          )
        ],
      );
    },);
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width - 80, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
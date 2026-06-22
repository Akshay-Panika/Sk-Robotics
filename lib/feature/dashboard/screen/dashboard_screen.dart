import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// UTILS IMPORTS
import '../../../core/utils/app_color.dart';
import '../../../core/utils/screen_helper.dart';

// FEATURE SCREENS IMPORTS (Apne actual file paths ke mutabik unhe import kar lena)
import '../../buy_now/screen/buy_now_screen.dart';
import '../../project/screen/project_screen.dart'; // <--- Make sure to create this file
import '../../event/screen/event_page.dart';
import '../../footer/screen/footer_page.dart';
import '../../gallery/screen/galley_screen.dart';
import '../../landing/screen/landing_page.dart';
import '../../landing/widget/project_card.dart';
import '../../partner/screen/partner_page.dart';
import '../../service/sreen/service_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isMenuOpen = false;

  // Independent Viewport Toggles
  bool _isBuyNowOpen = false;
  bool _isProjectOpen = false;
  String _activeSection = "Home";

  // Navigation Keys for Landing Page Scrolling
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _projectKey = GlobalKey();
  final GlobalKey _buyNowKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Future<void> _launchWhatsAppGlobal() async {
    const String phoneNumber = "917370027802";
    const String message = "Hello SK Robotics! I visited your platform and want to join/inquire about ongoing smart hardware development and prototyping tracks.";
    final Uri whatsappUri = Uri.parse("https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}");

    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint("Could not open WhatsApp channel.");
    }
  }

  void _scrollToSection(GlobalKey key, String sectionName) {
    setState(() {
      _activeSection = sectionName;
      _isMenuOpen = false;

      // State configurations based on section names
      _isBuyNowOpen = (sectionName == "Buy Now");
      _isProjectOpen = (sectionName == "Project");
    });

    // Scroll mechanism works only when separate screens are closed
    if (!_isBuyNowOpen && !_isProjectOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final context = key.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = ScreenHelper.isDesktop(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildFixedNavbar(isDesktop),
          Expanded(
            child: _isProjectOpen
                ? const ProjectScreen() // Renders clean Standalone Project View
                : _isBuyNowOpen
                ? const BuyNowScreen() // Renders clean Standalone Buy Now Grid Matrix
                : CustomScrollView(
              controller: _scrollController,
              slivers: [
                /// 1. Home / Landing Section
                SliverToBoxAdapter(
                  key: _homeKey,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height - 80,
                    child: const LandingPage(),
                  ),
                ),

                /// 2. Brand Partners
                SliverToBoxAdapter(child: const PartnerPage()),
                const SliverToBoxAdapter(child: SizedBox(height: 20)),

                /// 3. Mobile Inline Project Card Shortcut
                if (!isDesktop)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: const ProjectCard(showShadow: true)),
                    ),
                  ),

                /// 4. About / Events Section
                SliverToBoxAdapter(key: _aboutKey, child: const EventPage()),

                /// 5. Services Matrix Track
                SliverToBoxAdapter(key: _servicesKey, child: const ServicePage()),
                SliverToBoxAdapter(child: SizedBox(height: ScreenHelper.isMobile(context) ? 40 : 60)),

                /// 6. Media Gallery Layout
                const SliverToBoxAdapter(child: GalleyScreen()),

                /// 7. Anchor Node Footer
                SliverToBoxAdapter(key: _contactKey, child: const FooterPage()),
                const SliverToBoxAdapter(child: SizedBox(height: 40)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: !isDesktop
          ? FloatingActionButton.small(
        onPressed: _launchWhatsAppGlobal,
        backgroundColor: const Color(0xFF25D366),
        child: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
      )
          : null,
    );
  }

  // ==========================================
  // NAVIGATION COMPONENT TREE BUILDERS
  // ==========================================
  Widget _buildFixedNavbar(bool isDesktop) {
    return Container(
      color: AppColor.white,
      child: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), offset: const Offset(0, 1), blurRadius: 4)
                ],
              ),
              child: Row(
                mainAxisAlignment: isDesktop ? MainAxisAlignment.spaceAround : MainAxisAlignment.spaceBetween,
                children: [
                  // Logo Identity Node
                  GestureDetector(
                    onTap: () => _scrollToSection(_homeKey, "Home"),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "SK ROBOTICS",
                          style: TextStyle(color: AppColor.primary, fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 0.5),
                        ),
                        const SizedBox(height: 2),
                        Container(height: 2, width: 110, color: AppColor.primary)
                      ],
                    ),
                  ),

                  // Desktop Horizontal Menu Links
                  if (isDesktop)
                    Row(
                      children: [
                        _buildDesktopMenuButton("Home", _homeKey),
                        _buildDesktopMenuButton("About", _aboutKey),
                        _buildDesktopMenuButton("Service", _servicesKey),
                        _buildDesktopMenuButton("Project", _projectKey),
                        _buildDesktopMenuButton("Buy Now", _buyNowKey),
                      ],
                    ),

                  // Call To Action (CTA Buttons Layer)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isDesktop) ...[
                        ElevatedButton.icon(
                          onPressed: _launchWhatsAppGlobal,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primary,
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white, size: 16),
                          label: const Text("Join Now", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton(
                          onPressed: () => _scrollToSection(_contactKey, "Contact"),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
                            side: const BorderSide(color: AppColor.primary, width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                          child: const Text("Contact", style: TextStyle(color: AppColor.primary, fontWeight: FontWeight.bold)),
                        ),
                      ],
                      if (!isDesktop)
                        IconButton(
                          onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
                          icon: Icon(_isMenuOpen ? Icons.close : Icons.menu, color: AppColor.primary),
                        ),
                    ],
                  )
                ],
              ),
            ),

            // Mobile Sliding Overlay Menu Sub-Strip
            if (!isDesktop && _isMenuOpen)
              Container(
                width: double.infinity,
                color: AppColor.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Row(
                    children: [
                      _buildMobileMenuRowButton("Home", _homeKey),
                      _buildMobileMenuRowButton("About", _aboutKey),
                      _buildMobileMenuRowButton("Services", _servicesKey),
                      _buildMobileMenuRowButton("Project", _projectKey),
                      _buildMobileMenuRowButton("Buy Now", _buyNowKey),
                      _buildMobileMenuRowButton("Contact", _contactKey),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopMenuButton(String title, GlobalKey targetKey) {
    final bool isActive = _activeSection == title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () => _scrollToSection(targetKey, title),
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppColor.primary : Colors.grey.shade600,
        ),
        child: Text(title, style: TextStyle(fontSize: 15, fontWeight: isActive ? FontWeight.bold : FontWeight.w500)),
      ),
    );
  }

  Widget _buildMobileMenuRowButton(String title, GlobalKey targetKey) {
    final bool isActive = _activeSection == title;
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColor.primary.withOpacity(0.08) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          onPressed: () => _scrollToSection(targetKey, title),
          child: Text(
            title,
            style: TextStyle(color: isActive ? AppColor.primary : Colors.grey.shade700, fontSize: 13.5, fontWeight: isActive ? FontWeight.bold : FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
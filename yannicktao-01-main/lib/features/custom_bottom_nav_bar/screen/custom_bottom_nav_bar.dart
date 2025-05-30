// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:yannicktao/core/common/styles/global_text_style.dart';
// import 'package:yannicktao/core/utils/constants/app_texts.dart';
// import 'package:yannicktao/core/utils/constants/colors.dart';
// import 'package:yannicktao/core/utils/constants/icon_path.dart';
// import 'package:yannicktao/features/history/screen/history_screen.dart';
// import 'package:yannicktao/features/order/screen/order_screen.dart';
// import 'package:yannicktao/features/profile/screens/profile_screen.dart';
// import 'package:yannicktao/features/subscription/screens/subscription_initial_screen.dart';
//
// class CustomBottomNavBar extends StatefulWidget {
//   const CustomBottomNavBar({super.key});
//
//   @override
//   State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar>
//     with TickerProviderStateMixin {
//   late final TabController _tabController;
//   int _currentIndex = 0;
//
//   // প্রতিটি ট্যাবের জন্য আলাদা Navigator key
//   final List<GlobalKey<NavigatorState>> _navigatorKeys = [
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//     GlobalKey<NavigatorState>(),
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
//     _tabController.addListener(() {
//       setState(() {
//         _currentIndex = _tabController.index;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   // ট্যাব পরিবর্তনের সময় নেভিগেশন স্ট্যাক হ্যান্ডল করা
//   Widget _buildNavigator(int index, Widget child) {
//     return Offstage(
//       offstage: _currentIndex != index,
//       child: Navigator(
//         key: _navigatorKeys[index],
//         onGenerateRoute: (routeSettings) {
//           return MaterialPageRoute(
//             builder: (_) => child,
//           );
//         },
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.secondary,
//         centerTitle: false,
//         leadingWidth: 150,
//         leading: Text(
//           AppText.appName,
//           style: getTextStyle(
//             fontFamily: 'bricolage',
//             fontSize: 28,
//             fontWeight: FontWeight.w800,
//             color: AppColors.primary,
//             shadows: [
//               Shadow(
//                 offset: Offset(1, 1),
//                 blurRadius: 4.0,
//                 color: Colors.white.withValues(alpha: 0.3),
//               ),
//             ],
//           ),
//         ).marginOnly(left: 15),
//         actions: [
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(15),
//               color: Colors.white.withValues(alpha: 0.1),
//             ),
//             child: Stack(
//               children: [
//                 IconButton(
//                   onPressed: () {},
//                   icon: Image.asset(IconPath.belllogo),
//                 ),
//                 Positioned(
//                   right: 15,
//                   top: 10,
//                   child: Container(
//                     height: 10,
//                     width: 10,
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       shape: BoxShape.circle,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ).marginOnly(right: 15).paddingOnly(bottom: 10),
//         ],
//       ),
//       body: Stack(
//         children: [
//           _buildNavigator(0, SubscriptionInitial()),
//           _buildNavigator(1, OrderScreen()),
//           _buildNavigator(2, HistoryScreen()),
//           _buildNavigator(3, ProfileScreen()),
//         ],
//       ),
//       bottomNavigationBar: Container(
//         height: 90,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(16),
//             topRight: Radius.circular(16),
//           ),
//           color: AppColors.secondary,
//         ),
//         child: TabBar(
//           controller: _tabController,
//           unselectedLabelColor: Colors.grey.shade500,
//           dividerColor: Colors.transparent,
//           labelColor: Colors.white,
//           labelStyle: getTextStyle(
//             fontFamily: 'bricolage',
//             fontWeight: FontWeight.w600,
//             fontSize: 11,
//           ),
//           indicator: TopIndicator(),
//           tabs: <Widget>[
//             Tab(icon: Image.asset(IconPath.menulogo, scale: 30), text: 'Menu'),
//             Tab(icon: Image.asset(IconPath.order, scale: 30), text: 'Order'),
//             Tab(icon: Image.asset(IconPath.history, scale: 3), text: 'History'),
//             Tab(
//               icon: Image.asset(IconPath.profile, scale: 30),
//               text: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class TopIndicator extends Decoration {
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _TopIndicatorBox();
//   }
// }
//
// class _TopIndicatorBox extends BoxPainter {
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
//     Paint paint = Paint()
//       ..color = AppColors.primary
//       ..strokeWidth = 5
//       ..isAntiAlias = true;
//
//     canvas.drawLine(offset, Offset(cfg.size!.width + offset.dx, 0), paint);
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:yannicktao/core/common/styles/global_text_style.dart';
import 'package:yannicktao/core/utils/constants/colors.dart';
import 'package:yannicktao/core/utils/constants/icon_path.dart';
import 'package:yannicktao/features/history/screen/history_screen.dart';
import 'package:yannicktao/features/order/screen/order_screen.dart';
import 'package:yannicktao/features/profile/screens/profile_screen.dart';
import 'package:yannicktao/features/subscription/screens/subscription_initial_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  // List of screens for navigation
  List<Widget> _buildScreens() {
    return [SubscriptionInitial(), OrderScreen(), HistoryScreen(), ProfileScreen()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(IconPath.menulogo, height: 26).marginOnly(bottom: 5),
            Text(
              'Menu',
              style: getTextStyle(
                fontFamily: 'bricolage',
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        activeColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(IconPath.order, height: 26).marginOnly(bottom: 5),
            Text(
              'Order',
              style: getTextStyle(
                fontFamily: 'bricolage',
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        activeColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(IconPath.history, height: 26).marginOnly(bottom: 5),
            Text(
              'History',
              style: getTextStyle(
                fontFamily: 'bricolage',
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        activeColorPrimary: AppColors.primary,
      ),
      PersistentBottomNavBarItem(
        icon: Column(
          children: [
            Image.asset(IconPath.profile, height: 26).marginOnly(bottom: 5),
            Text(
              'Profile',
              style: getTextStyle(
                fontFamily: 'bricolage',
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        activeColorPrimary: AppColors.primary,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),

      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
      true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      // popBehaviorOnSelectedNavBarItemPress: PopActionScreensType.all,
      backgroundColor: AppColors.secondary,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),

      navBarHeight: 65,
      navBarStyle:
      NavBarStyle.style3, // Choose the nav bar style with this property
      decoration: NavBarDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        colorBehindNavBar: Colors.white, // Match background color
      ),
    );
  }
}

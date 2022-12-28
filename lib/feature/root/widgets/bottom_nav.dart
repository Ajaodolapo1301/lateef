import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Tabs { home, compass, search, message, notification }

extension TabExt on Tabs {
  String get name {
    switch (this) {
      case Tabs.home:
        return "Home";
      case Tabs.compass:
        return "Compass";
      case Tabs.search:
        return "Search";
      case Tabs.message:
        return "Message";
      case Tabs.notification:
        return "notification";

      default:
        return "";
    }
  }

  IconData get selectedIcon {
    switch (this) {
      case Tabs.home:
        return Icons.home;
      case Tabs.compass:
        return Icons.compass_calibration;
      case Tabs.search:
        return Icons.search;
      case Tabs.message:
        return Icons.message;
      case Tabs.notification:
        return Icons.notifications_rounded;

      default:
        return Icons.notifications_rounded;
    }
  }

  IconData get unSelectedIcon {
    switch (this) {
      case Tabs.home:
        return Icons.home;
      case Tabs.compass:
        return Icons.compass_calibration;
      case Tabs.search:
        return Icons.search;
      case Tabs.message:
        return Icons.message;
      case Tabs.notification:
        return Icons.notifications_rounded;

      default:
        return Icons.notifications_rounded;
    }
  }
}

class BottomNav extends StatelessWidget {
  final Tabs currentTab;
  final ValueChanged<Tabs> didSelectTab;

  const BottomNav(
      {Key? key, required this.currentTab, required this.didSelectTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Platform.isIOS ? 87.h : 65.h,
      child: BottomNavigationBar(
          currentIndex: Tabs.values.indexOf(currentTab),
          // unselectedLabelStyle: inActiveTextStyle(),
          // selectedLabelStyle: activeTextStyle(),
          backgroundColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            didSelectTab(Tabs.values.toList()[index]);
          },
          items: Tabs.values.map((tab) => _buildItem(tab, context)).toList()),
    );
  }

  BottomNavigationBarItem _buildItem(Tabs tab, BuildContext context) {
    return BottomNavigationBarItem(
        icon: Icon(
          currentTab == tab ? tab.selectedIcon : tab.unSelectedIcon,
          size: 20.h,
          // width: 20.w,
          // fit: BoxFit.scaleDown,
        ),
        label: tab.name);
  }

  // activeTextStyle() => TextStyle(
  //       fontFamily: FontFamily.plusJakartaSans,
  //       fontSize: 12.sp,
  //       color: AppColors.zeptaPurple,
  //       fontWeight: FontWeight.w600,
  //     );
  // inActiveTextStyle() => TextStyle(
  //       fontFamily: FontFamily.plusJakartaSans,
  //       fontSize: 12.sp,
  //       color: AppColors.zeptaGrayscale[20],
  //       fontWeight: FontWeight.w600,
  //     );
}

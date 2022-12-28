import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarItem extends StatelessWidget {
  final String label;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final bool isActive;
  const NavBarItem(
      {Key? key,
      required this.label,
      required this.activeIcon,
      required this.inactiveIcon,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    activeTextStyle(context) => TextStyle(
        // fontFamily: FontFamily.plusJakartaSans,
        fontSize: 11.sp,
        color: Theme.of(context).primaryColor,
        fontWeight: FontWeight.w500,
        height: 1.4);

    return isActive
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              children: [
                Icon(
                  activeIcon,
                  size: 20.r,
                  // height: 22.r,
                  // fit: BoxFit.cover,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(label, style: activeTextStyle(context)),
              ],
            ),
          )
        : Icon(
            inactiveIcon,
            size: 20.r,
            // height: 22.r,
          );
  }
}

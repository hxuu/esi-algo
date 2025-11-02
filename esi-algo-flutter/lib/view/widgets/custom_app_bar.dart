import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData leading;
  final Widget trailing;
  final Widget titleWidget;
  final GlobalKey<ScaffoldState> sKey;
  const CustomAppBar({
    super.key,
    required this.titleWidget,
    required this.leading,
    required this.trailing,
    required this.sKey,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Positioned.fill(
            top: 24.h,
            child: titleWidget,
          ),
          Positioned.fill(
            top: 18.h,
            left: 18.w,
            right: 35.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => sKey.currentState!.openDrawer(),
                  child: Icon(
                    leading,
                    size: 20.sp,
                  ),
                ),
                trailing,
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(
        double.maxFinite,
        50.h,
      );
}

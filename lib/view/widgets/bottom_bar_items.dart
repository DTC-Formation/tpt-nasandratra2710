import 'package:dtc_online_course/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarItems extends StatelessWidget {
  const BottomBarItems(
      {super.key,
      required this.icon,
      this.activeColor = primary,
      this.color = Colors.grey,
      this.isActive = false,
      this.tap});
  final String icon;
  final Color activeColor;
  final Color color;
  final bool isActive;
  final GestureTapCallback? tap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: bottomBarColor,
          boxShadow: [
            if (isActive)
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 0),
              ),
          ],
        ),
        child: SvgPicture.asset(
          icon,
          color: isActive ? activeColor : color,
        ),
      ),
    );
  }
}

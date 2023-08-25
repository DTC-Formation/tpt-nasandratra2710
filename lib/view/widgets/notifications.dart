import 'package:dtc_online_course/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key, required this.notifiedNumber});
  final int notifiedNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: appBarColor,
        border: Border.all(
          color: Colors.grey.withOpacity(.3),
        ),
      ),
      child: notifiedNumber > 0
          ? Badge(
              child: SvgPicture.asset(
                'assets/icons/bell.svg',
                width: 20,
                height: 20,
              ),
            )
          : SvgPicture.asset(
              'assets/icons/bell.svg',
              width: 20,
              height: 20,
            ),
    );
  }
}

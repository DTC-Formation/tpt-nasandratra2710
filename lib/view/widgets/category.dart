import 'package:dtc_online_course/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Category extends StatelessWidget {
  Category({super.key, required this.data});
  final data;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(1, 1),
              )
            ],
          ),
          child: SvgPicture.asset(
            data['icon'],
            width: 30,
            height: 30,
            color: textColor,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          data['name'],
          maxLines: 1,
          overflow: TextOverflow.fade,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

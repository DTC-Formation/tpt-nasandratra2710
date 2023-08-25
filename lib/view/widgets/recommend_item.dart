import 'package:cached_network_image/cached_network_image.dart';
import 'package:dtc_online_course/view/themes/color.dart';
import 'package:flutter/material.dart';

class RecommendItem extends StatelessWidget {
  RecommendItem({super.key, required this.data, this.onTab});
  final data;
  final GestureTapCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              child: CachedNetworkImage(
                imageUrl: data['image'],
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['name'],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  data['price'],
                  maxLines: 1,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    getAttribute(
                        data['session'], Icons.play_circle_outline, labelColor),
                    SizedBox(
                      width: 10,
                    ),
                    getAttribute(
                        data['duration'], Icons.timer_outlined, labelColor),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getAttribute(String info, IconData icon, Color color) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: color,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          style: TextStyle(
            color: labelColor,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

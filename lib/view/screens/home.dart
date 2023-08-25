import 'package:carousel_slider/carousel_slider.dart';
import 'package:dtc_online_course/view/themes/color.dart';
import 'package:dtc_online_course/view/utils/data.dart';
import 'package:dtc_online_course/view/widgets/category.dart';
import 'package:dtc_online_course/view/widgets/feature_item.dart';
import 'package:dtc_online_course/view/widgets/notifications.dart';
import 'package:dtc_online_course/view/widgets/recommend_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: buildBody(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: appBarColor,
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour et bienvenu sur :',
                  style: TextStyle(
                      color: labelColor,
                      fontWeight: FontWeight.w200,
                      fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'DTC Online Course',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Notifications(
              notifiedNumber: 0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getCategories(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 10),
            child: Text(
              'Featured',
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          getFeatures(),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 25, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recommended',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: labelColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          getRecommends(),
        ],
      ),
    );
  }

  Widget getRecommends() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recommends.length,
          (index) => Container(
            margin: EdgeInsets.only(right: 15, bottom: 5),
            child: RecommendItem(
              data: recommends[index],
              onTab: () {
                print(index);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget getFeatures() {
    return CarouselSlider(
      items: List.generate(
        features.length,
        (index) => FeatureItem(
          data: features[index],
          onTap: () {
            print(index);
          },
        ),
      ),
      options: CarouselOptions(
        height: 290,
        enlargeCenterPage: true,
        disableCenter: true,
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

  Widget getCategories() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) => Padding(
            padding: EdgeInsets.only(right: 15),
            child: Category(
              data: categories[index],
            ),
          ),
        ),
      ),
    );
  }
}

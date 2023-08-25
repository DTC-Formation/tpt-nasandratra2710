import 'package:dtc_online_course/view/screens/home.dart';
import 'package:dtc_online_course/view/screens/search.dart';
import 'package:dtc_online_course/view/themes/color.dart';
import 'package:dtc_online_course/view/widgets/bottom_bar_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Accueil extends StatefulWidget {
  const Accueil({super.key});

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
    );
  }

  Widget buildBody() {
    return IndexedStack(
      index: activePageIndex,
      children: List.generate(
        tabIndex.length,
        (index) => tabIndex[index]['page'],
      ),
    );
  }

  List tabIndex = [
    {
      'icon': 'assets/icons/home.svg',
      'page': Home(),
    },
    {
      'icon': 'assets/icons/search.svg',
      'page': Search(),
    },
    {
      'icon': 'assets/icons/play.svg',
      'page': Container(
        child: Center(
          child: Text('Comming Soon ...'),
        ),
      ),
    },
    {
      'icon': 'assets/icons/chat.svg',
      'page': Container(
        child: Center(
          child: Text('Comming Soon ...'),
        ),
      ),
    },
    {
      'icon': 'assets/icons/profile.svg',
      'page': Container(
        child: Center(
          child: Text('Comming Soon ...'),
        ),
      ),
    },
  ];

  int activePageIndex = 0;
  Widget buildBottomBar() {
    return Container(
      width: double.infinity,
      height: 75,
      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
      decoration: BoxDecoration(
        color: bottomBarColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomBarItems(
            isActive: activePageIndex == 0,
            icon: 'assets/icons/home.svg',
            tap: () {
              onPageIndexChanged(0);
            },
          ),
          BottomBarItems(
            isActive: activePageIndex == 1,
            icon: 'assets/icons/search.svg',
            tap: () {
              onPageIndexChanged(1);
            },
          ),
          BottomBarItems(
            isActive: activePageIndex == 2,
            icon: 'assets/icons/play.svg',
            tap: () {
              onPageIndexChanged(2);
            },
          ),
          BottomBarItems(
            isActive: activePageIndex == 3,
            icon: 'assets/icons/chat.svg',
            tap: () {
              onPageIndexChanged(3);
            },
          ),
          BottomBarItems(
            isActive: activePageIndex == 4,
            icon: 'assets/icons/profile.svg',
            tap: () {
              onPageIndexChanged(4);
            },
          ),
        ],
      ),
    );
  }

  onPageIndexChanged(index) {
    setState(() {
      activePageIndex = index;
    });
  }
}

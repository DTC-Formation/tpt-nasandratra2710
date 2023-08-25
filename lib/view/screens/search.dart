import 'package:dtc_online_course/view/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: getSearchBox(),
          ),
          SliverToBoxAdapter(
            child: getCategories(),
          ),
        ],
      ),
    );
  }

  getAppBar() {
    return Container(
      child: Row(
        children: [
          Text(
            'Search',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  getSearchBox() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40,
              padding: EdgeInsets.only(
                bottom: 3,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(.05),
                    spreadRadius: .5,
                    blurRadius: .5,
                    offset: Offset(0, 0),
                  )
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: labelColor,
                  ),
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              'assets/icons/filter.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  getCategories() {
    return SingleChildScrollView(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

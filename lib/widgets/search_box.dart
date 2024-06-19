import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodio/widgets/price_filter.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchChanged;

  const SearchBox({
    Key? key,
    required this.searchController,
    required this.onSearchChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 25, left: 15),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: appcolor.primaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 30,
                color: appcolor.InterfaceIconColor,
              ),
              hintText: 'Search "Zinger Burger"',
              hintStyle: FontStyles.lightTextStyle(),
            ),
            onChanged: onSearchChanged,
          ),
        ),
      ),
    );
  }
}

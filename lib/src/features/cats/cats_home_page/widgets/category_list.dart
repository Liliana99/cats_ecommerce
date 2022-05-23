// We need statefull widget because we are gonna change some state on our category
// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_app/src/constants/app_ui_padding.dart';
import 'package:ecommerce_app/src/features/cats/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/keys_test.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({this.key});
  final Key? key;

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // by default first item will be selected

  List categories = ['All', 'Blue Russo', 'Angora', 'Wild Norugian'];
  @override
  Widget build(BuildContext context) {
    final ListController listController = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: 30,
      child: ListView.builder(
        key: const Key(Keys.homeHorizontalScrollView),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => GestureDetector(
          key: const Key(Keys.clickFilterButton),
          onTap: () {
            setState(() {
              listController.filterItemList(index);
              listController.updateCategoryIndex(index);
            });
          },
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              // At end item it add extra 20 right  padding
              right: index == categories.length - 1 ? kDefaultPadding : 0,
            ),
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            decoration: BoxDecoration(
              color: index == listController.indexCategory.value
                  ? Colors.white.withOpacity(0.4)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              categories[index],
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

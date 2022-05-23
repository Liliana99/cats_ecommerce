// ignore_for_file: use_key_in_widget_constructors

import 'package:ecommerce_app/src/constants/app_ui_padding.dart';

import 'package:ecommerce_app/src/features/cats/cats_home_page/widgets/search_box.dart';
import 'package:ecommerce_app/src/features/cats/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/keys_test.dart';
import '../../cats_details/details/details_screen.dart';
import 'cat_card.dart';
import 'category_list.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ListController listController = Get.find();
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          SearchBox(onChanged: (value) {
            listController.filterItemList(value);
          }),
          // ignore: prefer_const_constructors
          CategoryList(),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: Stack(
              children: <Widget>[
                // Our background
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  decoration: const BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),

                Obx(() => ListView.builder(
                      key: const Key(Keys.homeScrollView),
                      // here we use our demo procuts list
                      itemCount: listController.filterList.isEmpty
                          ? listController.catList.value.length
                          : listController.filterList.value.length,
                      itemBuilder: (context, index) => CatCard(
                        key: const Key(Keys.cardWidget),
                        itemIndex: index,
                        cat: listController.item(index),
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                cat: listController.item(index),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

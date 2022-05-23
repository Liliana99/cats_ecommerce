import 'package:ecommerce_app/src/constants/keys_test.dart';
import 'package:ecommerce_app/src/features/cats/cats_home_page/cats_home_screen.dart';
import 'package:ecommerce_app/src/features/cats/cats_home_page/widgets/category_list.dart';
import 'package:ecommerce_app/src/features/cats/cats_home_page/widgets/home_screen_body.dart';
import 'package:ecommerce_app/src/features/cats/controllers/list_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

class HomeScreenRobot {
  HomeScreenRobot(this.tester);
  final WidgetTester tester;

  Future<void> scrollThePage({
    final bool scrollUp = false,
    required final Widget? parentWidget,
  }) async {
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(HomeScreenBody), findsOneWidget);
    final Finder listFinder = find.byKey(const Key(Keys.homeScrollView));
    if (scrollUp) {
      await tester.fling(listFinder, const Offset(0, 100), -100);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    } else {
      await tester.fling(listFinder, const Offset(0, -100), 100);
      await tester.pumpAndSettle(const Duration(seconds: 1));
    }
  }

  Future<void> clickOnCard({
    final bool scrollUp = false,
    required final Widget? parentWidget,
  }) async {
    await tester.pumpAndSettle();
    final Widget inkWellButton =
        find.byKey(const ValueKey(Keys.cardWidget)).evaluate().first.widget;
    await tester.tap(find.byWidget(inkWellButton));
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }

  Future<void> scrollHorizontalPage({
    final bool scrollUp = false,
    final int indexFilter = 0,
    required final Widget? parentWidget,
  }) async {
    final ListController listController = Get.find();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(CategoryList), findsOneWidget);
    final Finder listFinder =
        find.byKey(const Key(Keys.homeHorizontalScrollView));
    await tester.fling(listFinder, const Offset(200, 0), 100);
    makeFilterItem(indexFilter: 3);
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await clickOnButton(parentWidget: parentWidget);
    await tester.pumpAndSettle(const Duration(seconds: 1));
  }

  void makeFilterItem({
    final int indexFilter = 0,
  }) {
    final ListController listController = Get.find();
    listController.updateCategoryIndex(indexFilter);
    listController.filterItemList(indexFilter);
  }

  Future<void> clickOnButton({
    final int indexFilter = 0,
    required final Widget? parentWidget,
  }) async {
    makeFilterItem(indexFilter: 3);
    final Widget gestureDetectorButton = find
        .byKey(const ValueKey(Keys.clickFilterButton))
        .evaluate()
        .first
        .widget;
    await tester.tap(find.byWidget(gestureDetectorButton));
    await tester.pumpAndSettle(const Duration(seconds: 4));
  }
}

import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/src/constants/app_ui_padding.dart';
import 'package:ecommerce_app/src/features/cats/cats_details/details/details_screen.dart';
import 'package:ecommerce_app/src/features/cats/cats_home_page/cats_home_screen.dart';
import 'package:ecommerce_app/src/features/cats/cats_home_page/widgets/home_screen_body.dart';

import 'package:ecommerce_app/src/features/cats/controllers/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ecommerce_app/main.dart' as app;
import 'robots/detail_screen_robot.dart';
import 'robots/home_screen_robot.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  Get.lazyPut(
      () => ListController()); //We put the controller on the top of Tree

  HomeScreenRobot homeScreenRobot;
  DetailScreenRobot detailScreenRobot;

  group('e2e test', () {
    testWidgets('whole app', (WidgetTester tester) async {
      app.main;

      homeScreenRobot = HomeScreenRobot(tester);
      detailScreenRobot = DetailScreenRobot(tester);

      final Widget homePage = Scaffold(
        body: CatsHomeScreen(),
      );
      final ThemeData theme = ThemeData();

      await tester.pumpWidget(MyApp());
      await tester.pumpAndSettle();

      Widget myWidget(final Widget home) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cat Flutter App',
            theme: ThemeData(
              // We set Poppins as our default font
              textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(Get.context!).textTheme),
              primaryColor: KPrimaryColor,
              colorScheme: theme.colorScheme.copyWith(
                primary: KPrimaryColor,
                secondary: KPrimaryColor,
              ),

              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: home,
          );

      //*We need to wait until finish animation
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await homeScreenRobot.scrollThePage(
          parentWidget: myWidget(HomeScreenBody()));
      await homeScreenRobot.clickOnCard(
          parentWidget: myWidget(HomeScreenBody()));
      await detailScreenRobot.clickOnBackButton(
          parentWidget: myWidget(const DetailsScreen()));
      await tester.pumpAndSettle(const Duration(seconds: 4));
      await tester.pumpAndSettle(const Duration(seconds: 1));
      await homeScreenRobot.scrollHorizontalPage(
        parentWidget: myWidget(HomeScreenBody()),
      );
      await tester.pumpAndSettle(const Duration(seconds: 1));
    });
  });
}

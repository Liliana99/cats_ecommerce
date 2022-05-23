import 'package:ecommerce_app/src/models/cat.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/app_ui_padding.dart';
import 'cat_image.dart';
import 'chat_and_add_to_cart.dart';
import 'list_of_colors.dart';

class Body extends StatelessWidget {
  final Cat? cat;

  const Body({Key? key, this.cat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // it provide us total height and width
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small devices
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              decoration: const BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Hero(
                      tag: '${cat!.id}',
                      child: CatPoster(
                        size: size,
                        image: cat?.image,
                      ),
                    ),
                  ),
                  const ListOfColors(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Text(
                      cat!.raza!,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: kDefaultPadding / 2),
                    child: Text(
                      cat!.description!,
                      style: const TextStyle(color: kTextLightColor),
                    ),
                  ),
                  const SizedBox(height: kDefaultPadding),
                ],
              ),
            ),
            const ChatAndAddToCart(),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce_app/src/features/cats/controllers/list_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListController>(() => ListController(), fenix: true);
  }
}

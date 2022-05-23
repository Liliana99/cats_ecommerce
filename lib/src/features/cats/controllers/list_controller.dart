import 'package:ecommerce_app/src/models/cat.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  static ListController get to => Get.find();

  RxList<Cat> catList = <Cat>[].obs;
  RxInt indexList = 0.obs;
  RxInt indexCategory = 0.obs;
  Rx<Cat> filterItem = Cat().obs;
  RxList<Cat> filterList = <Cat>[].obs;

  @override
  void onInit() {
    super.onInit();
    catList.addAll(cats);
  }

  void filterItemList(int index) {
    filterList.clear();
    indexList.value = index;
    cleanFilter();
    if (index == 0) {
      //Had selected All
    } else {
      index = index - 1;
      filterItem.value = catList.elementAt(index);
      updateList();
    }
  }

  void updateList() {
    if (filterItem != null && filterItem.value.id != null) {
      return filterList.add(filterItem.value);
    }
  }

  void cleanFilter() {
    filterItem.value = Cat();
  }

  Cat item(int index) {
    if (filterList.isEmpty) {
      return catList[index];
    } else {
      return filterList[index];
    }
  }

  void updateCategoryIndex(int newIndex) {
    indexCategory.value = newIndex;
  }
}

part of shudhta;

class CategoryController extends GetxController {
  RxList<Categories> categories = <Categories>[].obs;
  RxBool isLoading = false.obs;

  void fetchCategories() async {
    isLoading.value = true;
    categories.clear();
    categories.addAll(await Categories.getAllCategories());
    isLoading.value = false;
    update();
  }
}

part of shudhta;

class HomeController extends GetxController {
  RxList<Categories> categories = <Categories>[].obs;
  RxList<Advertisement> advertisements = <Advertisement>[].obs;
  RxBool isCategoriesLoading = false.obs;
  RxBool isAdvertisementLoading = false.obs;
  RxBool isSectionLoading = false.obs;
  RxInt pendingNotifications = 0.obs;
  RxInt totalProductsInCart = 0.obs;

  void getData() {
    getCategories();
    getAdvertisements();
    // getSection();
  }

  void getCategories() async {
    isCategoriesLoading.value = true;
    categories.clear();
    final List<Categories> categoriesList = await Categories.getCategories();
    categories.addAll(categoriesList);
    isCategoriesLoading.value = false;
  }

  void getAdvertisements() async {
    isAdvertisementLoading.value = true;
    advertisements.clear();
    final List<Advertisement> advertisementsList =
        await Advertisement.getAdvertisements();
    advertisements.addAll(advertisementsList);
    isAdvertisementLoading.value = false;
  }

  void getSection() {}
}

part of shudhta;

class BeautyParlourController extends GetxController {
  RxList<BeautyParlour> _diagnostics = <BeautyParlour>[].obs;
  RxList<BeautyParlourService> _testsToBook = <BeautyParlourService>[].obs;
  RxBool isLoading = false.obs;
  RxBool isLoadingTests = false.obs;
  double totalPrice = 0;

  @override
  void onInit() {
    super.onInit();
  }

  Future<List<BeautyParlour>> fetchDiagnosticsCenter() async {
    isLoading.value = true;
    _diagnostics.clear();
    List<BeautyParlour> diagnosticCenters =
        await BeautyParlour.fetchDiagnosticsCenter();
    _diagnostics.addAll(diagnosticCenters);
    isLoading.value = false;
    return diagnosticCenters;
  }

  Future<List<BeautyParlourService>> fetchTests(
      BeautyParlour diagnosticCenter) async {
    isLoadingTests.value = true;
    update();
    Future<List<BeautyParlourService>> diagnosticTests =
        diagnosticCenter.fetchDiagnosticTests();
    isLoadingTests.value = false;
    update();
    return diagnosticTests;
  }

  void addToTestToBook(BeautyParlourService diagnosticTest) {
    _testsToBook.add(diagnosticTest);
    totalPrice += diagnosticTest.price;
    update();
  }

  void removeFromTestToBook(BeautyParlourService diagnosticTest) {
    _testsToBook.remove(diagnosticTest);
    totalPrice -= diagnosticTest.price;
    update();
  }

  Future<void> bookDiagnosis(DateTime date, TimeOfDay time, double? latitude,
      double? longitude) async {}
}

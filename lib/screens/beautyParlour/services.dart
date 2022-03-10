part of shudhta;

class DiagnosticsTests extends StatefulWidget {
  DiagnosticsTests({Key? key, required this.diagnosticCenter})
      : super(key: key);
  final BeautyParlour diagnosticCenter;
  final BeautyParlourController diagnosticController =
      Get.find<BeautyParlourController>();
  @override
  _DiagnosticsTestsState createState() => _DiagnosticsTestsState();
}

class _DiagnosticsTestsState extends State<DiagnosticsTests> {
  @override
  void initState() {
    super.initState();
    widget.diagnosticController.fetchTests(widget.diagnosticCenter);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Diagnostics Tests',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.all(10.0),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 0,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Image.network(widget.diagnosticCenter.imageURL!),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.diagnosticCenter.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                      ),
                      Text(widget.diagnosticCenter.address),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.95,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(50)),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  hintText: "Search tests",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder<List<BeautyParlourService>>(
                    future: widget.diagnosticController
                        .fetchTests(widget.diagnosticCenter),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount:
                                widget.diagnosticCenter.tests?.length ?? 0,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return TestItem(
                                  widget.diagnosticCenter.tests![index],
                                  widget.diagnosticController);
                            });
                      } else {
                        return ListView.builder(
                            itemCount: 6,
                            itemBuilder: (context, index) {
                              return Shimmer.fromColors(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    decoration: ShapeDecoration(
                                      color: Colors.grey[400]!,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 100,
                                  ),
                                  period: Duration(seconds: 2),
                                  baseColor: Colors.grey.shade200,
                                  highlightColor: Colors.grey.shade300);
                            });
                      }
                    })),
            Obx(() => widget.diagnosticController._testsToBook.length > 0
                ? SizedBox(
                    height: 70,
                  )
                : Container()),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            Obx(() => widget.diagnosticController._testsToBook.length > 0
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0.5,
                      primary: Get.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                    ),
                    onPressed: () {},
                    child: Container(
                      height: 70,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Total price ${widget.diagnosticController.totalPrice}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          // Obx(() {
                          //   return Text('Total:',
                          //       style:
                          //           TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
                          // }),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.5,
                                primary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDiagnostics(),
                                  ),
                                );
                              },
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Get.theme.primaryColor),
                              ))
                        ],
                      ),
                    ),
                  )
                : Container()),
      ),
    );
  }
}

class TestItem extends StatelessWidget {
  TestItem(this.test, this.diagnosticController);
  final BeautyParlourService test;
  final BeautyParlourController diagnosticController;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              spreadRadius: 0,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.network(
              test.imageURL!,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    test.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    test.description ?? "",
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rs. ${test.price}",
                        style: TextStyle(fontSize: 18, color: Colors.green),
                      ),
                      Obx(() => ElevatedButton(
                            onPressed: () {
                              if (diagnosticController._testsToBook
                                  .contains(test)) {
                                diagnosticController.removeFromTestToBook(test);
                              } else {
                                diagnosticController.addToTestToBook(test);
                              }
                            },
                            child:
                                diagnosticController._testsToBook.contains(test)
                                    ? Text("remove")
                                    : Text("Add"),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

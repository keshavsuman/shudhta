part of shudhta;

class Diagnostics extends StatefulWidget {
  Diagnostics({Key? key}) : super(key: key);
  final BeautyParlourController diagnosticsController =
      Get.put(BeautyParlourController());

  @override
  _DiagnosticsState createState() => _DiagnosticsState();
}

class _DiagnosticsState extends State<Diagnostics> {
  @override
  void initState() {
    super.initState();
    widget.diagnosticsController.fetchDiagnosticsCenter();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Diagnostics',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Text(
              "Your Nearby Diagnostic centers",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
            child: Text(
              "Book your test for diagnostics, our executive will collect your sample from your home",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Expanded(
              child: Obx(() => widget.diagnosticsController.isLoading.isTrue
                  ? ListView.builder(
                      itemCount: 4,
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
                              height: MediaQuery.of(context).size.height / 3.5,
                            ),
                            period: Duration(seconds: 2),
                            baseColor: Colors.grey.shade200,
                            highlightColor: Colors.grey.shade300);
                      })
                  : widget.diagnosticsController._diagnostics.length == 0
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "oops...no nearby diagnostics available",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              widget.diagnosticsController._diagnostics.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DiagnosticsTests(
                                            diagnosticCenter: widget
                                                .diagnosticsController
                                                ._diagnostics[index])));
                              },
                              child: Card(
                                clipBehavior: Clip.hardEdge,
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Stack(
                                  children: [
                                    Container(
                                      child: Image.network(
                                        widget.diagnosticsController
                                            ._diagnostics[index].imageURL!,
                                        fit: BoxFit.cover,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3.5,
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3.5,
                                      padding: EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                        colors: [
                                          Colors.black.withOpacity(1),
                                          Colors.black.withOpacity(0.1),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center,
                                      )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.diagnosticsController
                                                ._diagnostics[index].name,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                            widget.diagnosticsController
                                                ._diagnostics[index].address,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }))),
        ],
      ),
    ));
  }
}

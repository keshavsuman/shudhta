part of shudhta;

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController());
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: ShudhtaDrawer(),
      body: CustomScrollView(slivers: [
        // SliverAppBar(
        //   expandedHeight: 70.0,
        //   flexibleSpace: FlexibleSpaceBar(
        //     title: Text('Goa', textScaleFactor: 1),
        //     // background: Image.asset(
        //     //   'assets/images/beach.png',
        //     //   fit: BoxFit.fill,
        //     // ),
        //   ),
        // ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(Icons.menu),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(ProfileScreen());
                      },
                      child: Text(
                        'Hi,Isha jain',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      'Welcome to the app',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )),
              Obx(() => Stack(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/notifications');
                        },
                        icon: Icon(Icons.notifications_outlined)),
                    Positioned(
                      top: 7,
                      right: 10,
                      child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(widget
                                .homeController.pendingNotifications
                                .toString()),
                          )),
                    ),
                  ])),
              Obx(() => Stack(children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        icon: Icon(Icons.shopping_cart_outlined)),
                    Positioned(
                      top: 7,
                      right: 10,
                      child: Container(
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(widget
                                .homeController.totalProductsInCart
                                .toString()),
                          )),
                    ),
                  ])),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.90,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(50)),
            child: TextFormField(
              onChanged: (value) => {},
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                hintText: 'Search for any product',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Our Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: MediaQuery.of(context).size.height / 4,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network("https://picsum.photos/300/200"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Upload Prescription",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "to get your medicine delivered to your home",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: MediaQuery.of(context).size.height / 4,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 2,
                            )
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network("https://picsum.photos/300/200"),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Upload Prescription",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "to get your medicine delivered to your home",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Obx(() {
          if (_controller.isCategoriesLoading.isFalse) {
            return SliverToBoxAdapter(
                child: CategoriesList(categories: _controller.categories));
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
        Obx(() {
          if (_controller.isAdvertisementLoading.isFalse) {
            return SliverToBoxAdapter(
                child:
                    Advertisements(advertisements: _controller.advertisements));
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  Container(
                    height: 50.0,
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Section name',
                              style: new TextStyle(fontSize: 20.0)),
                        ),
                      ],
                    ),
                  ),
                  1 == 1
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 0.7,
                            children: List.generate(
                              8,
                              (index) {
                                return ProductTile();
                              },
                            ),
                          ),
                        )
                      : Container(
                          child: ListView.builder(
                              itemCount: 2,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ProductTile();
                              }),
                        ),
                ],
              );
            },
            childCount: 5,
          ),
        )
        // SliverToBoxAdapter(child: Section())
      ]),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [

      //       // CategoriesList(),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Advertisements(),
      //       TopSales(),
      //       NewArrival()
      //     ],
      //   ),
      // ),
    ));
  }
}

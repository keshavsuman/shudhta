part of shudhta;

class CategoriesPage extends StatefulWidget {
  // final EcommerceController ecommerceController =
  //     Get.find<EcommerceController>();
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
      leading: isDrawerOpen
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                setState(
                  () {
                    xOffset = 0;
                    yOffset = 0;
                    scaleFactor = 1;
                    isDrawerOpen = false;
                  },
                );
              },
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                setState(() {
                  xOffset = size.width - size.width / 3;
                  yOffset = size.height * 0.1;
                  scaleFactor = 0.8;
                  isDrawerOpen = true;
                });
              },
            ),
      // title: AppBarTitleWidget(),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_cart_outlined),
          onPressed: () {
            Get.toNamed('/cart');
          },
        ),
        IconButton(
          onPressed: () => Navigator.pushNamed(context, '/notifications'),
          icon: Icon(
            Icons.notifications_none,
          ),
        ),
      ],
    ));
    // body
    //  widget.ecommerceController.isCategoryLoading.isTrue
    //           ? Center(child: CircularProgressIndicator())
    //           : ListView.builder(
    //               padding: EdgeInsets.symmetric(horizontal: 10),
    //               itemBuilder: (context, index) {
    //                 return Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       widget.ecommerceController.categories[index]
    //                           .name,
    //                       style: TextStyle(
    //                           fontSize: 20,
    //                           fontWeight: FontWeight.bold,
    //                           color: Colors.black),
    //                     ),
    //                     GridView.builder(
    //                         shrinkWrap: true,
    //                         physics: BouncingScrollPhysics(),
    //                         gridDelegate:
    //                             SliverGridDelegateWithFixedCrossAxisCount(
    //                           crossAxisCount: 2,
    //                           // childAspectRatio: 0.8,
    //                           crossAxisSpacing: 2,
    //                           mainAxisSpacing: 2,
    //                         ),
    //                         itemBuilder: (context, i) {
    //                           return CategoryTile(widget
    //                               .ecommerceController
    //                               .categories[index]
    //                               .subCategories[i]);
    //                         },
    //                         itemCount: widget
    //                             .ecommerceController
    //                             .categories[index]
    //                             .subCategories
    //                             .length),
    //                   ],
    //                 );
    //               },
    //               itemCount:
    //                   widget.ecommerceController.categories.length)),
    // ),
  }
}

// class CategoryTile extends StatelessWidget {
//   final SubCategories subCategory;
//   const CategoryTile(this.subCategory);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Expanded(
//               child: Image.network(subCategory.image_url, fit: BoxFit.contain)),
//           Text(
//             subCategory.name,
//             style: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
//           ),
//         ],
//       ),
//     );
//   }
// }

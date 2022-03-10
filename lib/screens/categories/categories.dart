part of shudhta;

class CategoriesPage extends StatefulWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  void initState() {
    super.initState();
    widget.categoryController.fetchCategories();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ShudhtaAppBar(),
      body: GetBuilder<CategoryController>(
          builder: (controller) => widget.categoryController.isLoading.isTrue
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.categoryController.categories[index].name,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // childAspectRatio: 0.8,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                            ),
                            itemBuilder: (context, i) {
                              return CategoryTile(widget.categoryController
                                  .categories[index].subCategories[i]);
                            },
                            itemCount: widget.categoryController
                                .categories[index].subCategories.length),
                      ],
                    );
                  },
                  itemCount: widget.categoryController.categories.length)),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final SubCategories subCategory;
  const CategoryTile(this.subCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // color: Colors.white,
      ),
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Image.network(subCategory.imageUrl, fit: BoxFit.cover)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subCategory.name,
              style: TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
            ),
          ),
        ],
      ),
    );
  }
}

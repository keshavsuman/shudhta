part of shudhta;

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            'https://picsum.photos/300/200?image=9',
            fit: BoxFit.cover,
          ),
          Text(
            'Product Tile',
            style: TextStyle(fontSize: 18),
          ),
          Text('Product Description'),
          ElevatedButton(
              style: buttonStyle,
              onPressed: () {},
              child: Container(
                  // padding: EdgeInsets.zero,
                  // margin: EdgeInsets.zero,
                  width: double.infinity,
                  child: Center(child: Text('Add To cart'))))
        ],
      ),
    );
  }
}

part of ecommerce;

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Image.network(
                  'https://cdn.pixabay.com/photo/2021/08/25/20/42/field-6574455__340.jpg',
                  fit: BoxFit.contain,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Red Apples',
                    style: PRIMARY_TEXT_STYLE,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1kg,indian',
                        style: SECONDARY_TEXT_STYLE,
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 35,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '\$20',
                          style: SECONDARY_TEXT_STYLE,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Product Detail',
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                  Text(
                      'sadhgiu hasfdogujhi gadtij ai jatri hjaei jaij hatiejatj oijhoia aitjhaeikjoa othgoeeijtseijrys'),
                  Spacer(),
                  Row(
                    children: [Text('Review'), Text('Rating')],
                  ),
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          'Add to cart',
                          style: TextStyle(fontSize: 20),
                        ))),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

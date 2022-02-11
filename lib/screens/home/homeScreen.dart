part of ecommerce;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi,Isha jain',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'Welcome to the app',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                )),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(5)),
              child: TextFormField(
                onChanged: (value) => {},
                decoration: InputDecoration(
                  hintText: 'Search for any product',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            CategoriesList(),
            SizedBox(
              height: 10,
            ),
            Advertisements(),
            TopSales(),
            NewArrival()
          ],
        ),
      ),
    ));
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'shudhta.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Shudhta(),
      theme: ThemeData(
        fontFamily: 'Roboto',
        primaryColor: PRIMARY_COLOR,
        // primaryColorDark: Colors.white,
        // backgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Shudhta extends StatefulWidget {
  const Shudhta({Key? key}) : super(key: key);

  @override
  _ShudhtaState createState() => _ShudhtaState();
}

class _ShudhtaState extends State<Shudhta> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 50,
      //   backgroundColor: PRIMARY_COLOR,
      //   items: [
      //     Icon(Icons.home, size: 30),
      //     Icon(Icons.search, size: 30),
      //     Icon(Icons.shopping_cart, size: 30),
      //     Icon(Icons.person, size: 30),
      //   ],
      //   index: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeScreen(),
          WishlistScreen(),
          ShoppingCart(),
          ProfileScreen()
        ],
      ),
    ));
  }
}

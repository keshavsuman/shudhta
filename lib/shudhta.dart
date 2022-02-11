library shudhta;

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

part 'utils/Constants.dart';
part 'utils/styles.dart';
part 'utils/client.dart';
part 'utils/APIRoutes.dart';

part 'models/advertisementModel.dart';
part 'models/userModel.dart';
part 'models/orderModel.dart';
part 'models/productModel.dart';
part 'models/cartModel.dart';

// part 'components/BottomNavigationBar.dart';

part 'screens/home/homeScreen.dart';
part 'screens/home/widgets/categoryList.dart';
part 'screens/home/widgets/topSales.dart';
part 'screens/home/widgets/newArrival.dart';
part 'screens/home/widgets/advertisements.dart';
part 'screens/home/homeController.dart';
part 'screens/checkout/checkout.dart';
part 'screens/wishlist/wishlistScreen.dart';
part 'screens/categories/categories.dart';

part 'screens/profile/profileScreen.dart';
part 'screens/productDetails/productDetails.dart';
part 'screens/myOrders/myOrdersScreen.dart';
part 'screens/myOrders/orderControllers.dart';
part 'screens/shoppingCart/shoppingCart.dart';

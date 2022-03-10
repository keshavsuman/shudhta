library shudhta;

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:vector_math/vector_math.dart' as Vector;
import "package:intl/intl.dart";

part 'utils/Constants.dart';
part 'utils/styles.dart';
part 'utils/client.dart';
part 'utils/shudhtaRoutes.dart';
part 'utils/APIRoutes.dart';

part 'models/advertisementModel.dart';
part 'models/userModel.dart';
part 'models/orderModel.dart';
part 'models/productModel.dart';
part 'models/cartModel.dart';
part 'models/categories.dart';
part 'models/notificationModel.dart';
part 'models/beautyParlourModel.dart';
part 'models/beautyParlourServices.dart';

part 'components/AppBar.dart';
part 'components/drawer.dart';

part "screens/categories/categoryController.dart";

part "screens/auth/login.dart";
part "screens/auth/widgets/waveHeader.dart";
part "screens/auth/signup.dart";
part "screens/auth/otp.dart";
part "screens/auth/authController.dart";
part "screens/auth/forgetpassword.dart";
part 'screens/home/homeScreen.dart';
part 'screens/products/searchProducts.dart';
part 'screens/home/widgets/categoryList.dart';
part 'screens/home/widgets/advertisements.dart';
part 'screens/home/widgets/productTile.dart';
part 'screens/home/homeController.dart';
part 'screens/checkout/checkout.dart';
part 'screens/wishlist/wishlistScreen.dart';
part 'screens/categories/categories.dart';
part 'screens/address/address.dart';
part 'screens/aboutUs/aboutUs.dart';
part 'screens/contactUs/contactUs.dart';
part 'screens/splashScreen.dart';
part 'screens/beautyParlour/beautyParlourController.dart';
part 'screens/beautyParlour/beautyParlours.dart';
part 'screens/beautyParlour/bookAppointment.dart';
part 'screens/beautyParlour/services.dart';

part 'screens/profile/profileScreen.dart';
part 'screens/productDetails/productDetails.dart';
part 'screens/myOrders/myOrdersScreen.dart';
part 'screens/myOrders/orderControllers.dart';
part 'screens/shoppingCart/shoppingCart.dart';
part 'screens/notifications/notifications.dart';
part 'screens/notifications/notificationTile.dart';
part 'screens/notifications/notificationController.dart';
part 'screens/products/products.dart';

part 'screens/intro/intropage1.dart';
part 'screens/intro/intropage2.dart';
part 'screens/intro/intropage3.dart';

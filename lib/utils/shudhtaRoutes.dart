part of shudhta;

class ShudhtaRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (context) => Login());
      case '/signup':
        return MaterialPageRoute(builder: (context) => Signup());
      case '/forgetPassword':
        return MaterialPageRoute(builder: (context) => ForgetPassword());
      case '/otp':
        return MaterialPageRoute(
            builder: (context) => OTPPage(settings.arguments as String));
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case '/profile':
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      case '/notifications':
        return MaterialPageRoute(builder: (context) => Notifications());
      case '/wishlist':
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case '/cart':
        return MaterialPageRoute(builder: (context) => ShoppingCart());
      case '/allCategories':
        return MaterialPageRoute(builder: (context) => CategoriesPage());
      case '/checkout':
        return MaterialPageRoute(builder: (context) => ShoppingCart());
      case '/beautyParlours':
        return MaterialPageRoute(builder: (context) => ShoppingCart());
      case '/beautyParlourServices':
        return MaterialPageRoute(builder: (context) => ShoppingCart());
      case '/bookServices':
        return MaterialPageRoute(builder: (context) => ShoppingCart());

      default:
        MaterialPageRoute(builder: (context) => HomeScreen());
    }
    return MaterialPageRoute(builder: (context) => HomeScreen());
  }
}

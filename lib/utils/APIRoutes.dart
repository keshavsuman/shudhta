part of shudhta;

class APIRoutes {
  static final String login = '/api/user/auth/login';
  static final String signup = '/api/user/auth/login';
  static final String getCart = '/api/user/auth/login';
  static final String getOrders = '/api/user/auth/login';
  static final String getAdvertisements = '/api/user/getAdvertisements';
  static final String getCategories = '/api/user/getCategories';
  static final String getAllCategories = '/api/user/getAllCategories';
  static final String getNearByBeautyParlours =
      '/api/user/getNearbyBeautyParlour';
  static String getBeautyParlourServices(id) =>
      '/api/user/getBeautyParlourServices/$id';
}

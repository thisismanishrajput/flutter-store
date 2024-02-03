class Api {
  static const baseUrl= "http://10.0.2.2:3000";

  static String login() => "$baseUrl/user/login";
  static String brand() => "$baseUrl/admin/getBrand";
  static String products() => "$baseUrl/user/getProducts";
}
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/models/products/brand_model.dart';
import 'package:flutter_ecommerce/models/products/product_model.dart';

abstract class ProductRepository  extends ChangeNotifier{
  /// Brand List
  List<Brand> get brandList;
  bool get isBrandLoading ;

  /// Products List
  List<Product> get productList;
  bool get isProductLoading ;

  List<Product> get searchedProductList;

  Future<void> category({required BuildContext context});
  Future<void> brands({required BuildContext context});
  Future<void> fetchProducts({required BuildContext context});
  Future<void> searchProduct({required String query});
  Future<void> clearData();


}
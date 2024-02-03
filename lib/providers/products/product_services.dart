import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/api/api.dart';
import 'package:flutter_ecommerce/helpers/access_token_validator.dart';
import 'package:flutter_ecommerce/models/products/brand_model.dart';
import 'package:flutter_ecommerce/models/products/product_model.dart';
import 'package:flutter_ecommerce/providers/auth/auth_repository.dart';
import 'package:flutter_ecommerce/providers/products/products_repository.dart';
import 'package:provider/provider.dart';


class ProductServices extends ChangeNotifier implements ProductRepository{
  final Dio _dio = Dio();

  List<Brand> _brandList = [];
  List<Product> _productList = [];
  List<Product> _searchedProductList = [];

  bool _isBrandLoading = false;
  bool _isProductLoading = false;


  @override
  List<Brand> get brandList => _brandList;

  @override
  bool get isBrandLoading => _isBrandLoading;


  @override
  List<Product> get productList => _productList;

  @override
  List<Product> get searchedProductList => _searchedProductList;

  @override
  bool get isProductLoading => _isProductLoading;


  @override
  Future<void> brands({required BuildContext context})async {
    try {
      _isBrandLoading = true;
      final accessToken = await Provider.of<AuthRepository>(context, listen: false).getAccessToken(context);

      var response = await _dio.get(
        Api.brand() ,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken"
          },
        ),
      );

      if(response.statusCode == 200){
        _brandList = BrandModel.fromJson(response.data).data;
        _isBrandLoading = true;
        notifyListeners();
      }
    }on DioException catch (e) {
      print(e);

    }finally{
      if(_isBrandLoading){
        _isBrandLoading = false;
        notifyListeners();
      }
    }
  }

  @override
  Future<void> fetchProducts({required BuildContext context})async {
    try {
      _isProductLoading = true;
      final accessToken = await Provider.of<AuthRepository>(context, listen: false).getAccessToken(context);

      var response = await _dio.get(
        Api.products() ,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $accessToken"
          },
        ),
      );

      if(response.statusCode == 200){
        _productList = ProductModel.fromJson(response.data).data;
        _isProductLoading = true;
        notifyListeners();
      }
    }on DioException catch (e) {
      print(e);

    }finally{
      if(_isProductLoading){
        _isProductLoading = false;
        notifyListeners();
      }
    }
  }

  @override
  Future<void> category({required BuildContext context}) async{
  }

  @override
  Future<void> searchProduct({required String query}) async {
    print(query);

    // Convert both query and title to lowercase for case-insensitive search
    String lowercaseQuery = query.toLowerCase();

    _searchedProductList = _productList
        .where((element) => element.title.toLowerCase().contains(lowercaseQuery))
        .toList();
_searchedProductList.addAll(_productList);
    notifyListeners();
  }


  @override
  Future<void> clearData()async{
    _searchedProductList.clear();
    notifyListeners();
  }


}

import 'dart:convert';
import '../models/product.dart';
import 'base_provider.dart';

class ProductProvider extends BaseProvider<Product> {
  ProductProvider(): super("Product");

   @override
  Product fromJson(data) {
    return Product.fromJson(data);
  }

}
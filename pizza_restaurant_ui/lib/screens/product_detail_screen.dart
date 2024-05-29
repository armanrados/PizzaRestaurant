import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/providers/product_provider.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../utils/util.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = "/product_details";
  String id;
  ProductDetailScreen(this.id,{Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
 ProductProvider? _productProvider;
  Product? _product;

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _productProvider = context.read<ProductProvider>();
    loadData();
  }

    Future loadData() async {
     var tmp = await _productProvider!.getById(int.parse(this.widget.id));
     setState(() {
      _product = tmp;
    });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product details"),backgroundColor: Colors.amber,),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          ProductDetails()
        ]),
      ),
    );
  }

  Widget ProductDetails()
  {
    if(_product == null)
    {
      return Center(child: Text("Loading details"),);
    }

    else{
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(_product?.name! ?? "N/A", style: TextStyle(fontSize: 36 , fontWeight: FontWeight.bold),),
                  SizedBox(height:15),
                  Container(
                    child: imageFromBase64String(_product!.image!),
                    width:300
                  ),
                  SizedBox(height:15),
                  Text("Price: ${formatNumber(_product?.price!)} EUR" , style: TextStyle(fontSize: 20),),
                  SizedBox(height:15),
                  Row(children: [
                    Expanded(child: Container(child: Text("${_product!.description}" , style: TextStyle(fontSize: 16),)))
                  ],)]),
              )),
      );
    }
  }
}
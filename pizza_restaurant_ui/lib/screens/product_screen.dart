import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/providers/order_provider.dart';
import 'package:pizza_restaurant_ui/providers/product_provider.dart';
import 'package:pizza_restaurant_ui/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../utils/util.dart';
import 'cart_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);
  static const String routeName = "/product";

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  TextEditingController _searchController = TextEditingController();
  ProductProvider? _productProvider;
  CartProvider? _cartProvider;
  OrderProvider? _orderProvider;
  List<Product> productData = [];

  @override
  void initState() {
    super.initState();
    _productProvider = context.read<ProductProvider>();
    _cartProvider = context.read<CartProvider>();
    _orderProvider = context.read<OrderProvider>();
    loadData();
  }

 Future loadData() async {
    var products = await _productProvider!.get({'includeUser': true});
    setState(() {
      productData = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Menu"),
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [_buildProductSearch(), ..._buildProducts()]),
            ),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CartScreen.routeName);
          },
          backgroundColor: Colors.amber,
          child: const Icon(Icons.shopping_cart),
        ));
  }

  Widget _buildProductSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: "Search",
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.amber))),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: IconButton(
            icon: Icon(
              Icons.search_rounded,
              color: Colors.amber,
            ),
            onPressed: () async {
              var tmpData = await _productProvider
                  ?.get({'name': _searchController.text});
              var tmpOrders = await _orderProvider?.get({
                'includeUser': true,
                'includeOrderProduct': true,
                'includePayment': true
              });
              setState(() {
                if (_searchController.text != "") {
                  productData = tmpData!;
                } else if (tmpOrders!.length < 2) {
                  productData = tmpData!;
                } else {
                  productData = [];
                }
              });
            },
          ),
        )
      ],
    );
  }

 List<Widget> _buildProducts() {
    List<Widget> list = [];

    if (productData.isEmpty) {
      return [Text("Menu is loading...")];
    } else {
      list = productData
          .map((e) => Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context,
                          "${ProductDetailScreen.routeName}/${e.productID}");
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 200,
                              width: double.infinity,
                              child: imageFromBase64String(e.image!),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.name!,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                      ),
                                    ),
                                    Container(
                                      height: 20,
                                    ),
                                    Text(
                                      'Price: ${formatNumber(e.price)} EUR',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ]),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber),
                                  onPressed: () {
                                    _cartProvider?.addToCart(e);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text("Product added!"),
                                            backgroundColor: Colors.amber));
                                  },
                                  icon: Icon(
                                    // <-- Icon
                                    Icons.shopping_cart,
                                    size: 24.0,
                                  ),
                                  label: Text('Add to cart'),
                                ))
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ))
          .cast<Widget>()
          .toList();
    }

    return list;
  }
}


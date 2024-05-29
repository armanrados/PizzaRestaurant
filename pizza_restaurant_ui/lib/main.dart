
import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/models/order_product.dart';
import 'package:pizza_restaurant_ui/providers/cart_provider.dart';
import 'package:pizza_restaurant_ui/providers/gallery_provider.dart';
import 'package:pizza_restaurant_ui/providers/order_provider.dart';
import 'package:pizza_restaurant_ui/providers/payment_provider.dart';
import 'package:pizza_restaurant_ui/providers/product_provider.dart';
import 'package:pizza_restaurant_ui/providers/user_provider.dart';
import 'package:pizza_restaurant_ui/screens/cart_screen.dart';
import 'package:pizza_restaurant_ui/screens/gallery_list_screen.dart';
import 'package:pizza_restaurant_ui/screens/home_screen.dart';
import 'package:pizza_restaurant_ui/screens/order_screen.dart';
import 'package:pizza_restaurant_ui/screens/product_detail_screen.dart';
import 'package:pizza_restaurant_ui/screens/profile_modify_screen.dart';
import 'package:pizza_restaurant_ui/utils/util.dart';
import 'package:provider/provider.dart';
void main() {


  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ProductProvider()),
      ChangeNotifierProvider(create: (_) => GalleryProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => PaymentProvider()),
      ChangeNotifierProvider(create: (_) => OrderProvider()),
    
    ],
    child: MaterialApp(
      theme: ThemeData(primaryColor: Color.fromARGB(255, 255, 253, 253)),
      debugShowCheckedModeBanner: true,
      home: MyApp(),
      onGenerateRoute: (settings) {
       
        if (settings.name == GalleryListScreen.routeName) {
          return MaterialPageRoute(
              builder: ((context) => GalleryListScreen()));
        }
        if (settings.name == HomeScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => HomeScreen()));
        }
      
     
        if (settings.name == CartScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => CartScreen()));
        }
        if (settings.name == OrderScreen.routeName) {
          return MaterialPageRoute(builder: ((context) => OrderScreen()));
        }

        var uri = Uri.parse(settings.name!);
        if (uri.pathSegments.length == 2 &&
            "/${uri.pathSegments.first}" == ProductDetailScreen.routeName) {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
              builder: (context) => ProductDetailScreen(id));
        
        } else if (uri.pathSegments.length == 2 &&
            "/${uri.pathSegments.first}" == ProfileModifyScreen.routeName) {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
              builder: (context) => ProfileModifyScreen(id));
        }
      },
    ),
  ));
}

class MyApp extends StatelessWidget {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  late UserProvider _userProvider;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/pizzalogo.jpg"),
                fit: BoxFit.scaleDown)),
        child: Column(
          children: [
            SizedBox(
              height: 450,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Input username!";
                        } else if (value.length < 3) {
                          return "Username needs to contain more than 3 letters";
                        }
                        return null;
                      },
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      controller: _username,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 177, 173, 173)
                              .withOpacity(0.3),
                          filled: true,
                          border: InputBorder.none,
                          hintText: "Username",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 11, 9, 0))),
                    ),
                    padding: EdgeInsets.all(8),
                  ),
                  Container(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password can not be empty";
                        } else if (value.length < 4) {
                          return "Password needs to contain more then 4 letters!";
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(color: Color.fromARGB(255, 1, 1, 0)),
                      controller: _password,
                      decoration: InputDecoration(
                          fillColor: Color.fromARGB(255, 177, 173, 173)
                              .withOpacity(0.3),
                          border: InputBorder.none,
                          hintText: "Password",
                          filled: true,
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 4, 3, 0))),
                    ),
                    padding: EdgeInsets.all(8),
                  ),
                  TextButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          Authorization.username = _username.text;
                          Authorization.password = _password.text;

                          Authorization.user =
                              await _userProvider.Authenticate();
                          if (
                                  Authorization.user?.roleNames
                                          ?.contains("Administrator") ==
                                      true ||
                              Authorization.user?.roleNames
                                      ?.contains("Employee") ==
                                  true) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Warning'),
                                content: Text(
                                    "Incorrect username or password!"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the alert
                                    },
                                    child: Text('OK'),
                                  )
                                ],
                              ),
                            );
                          } else {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName, (route) => false);
                          }
                        } catch (e) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text("Warning"),
                                    content: Text(
                                        "Incorrect username or password!"),
                                    actions: [
                                      TextButton(
                                        child: Text("Ok"),
                                        onPressed: () => Navigator.pop(context),
                                      )
                                    ],
                                  ));
                        }
                      }
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber),
                      child: Center(
                          child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 14.0),
                      )),
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    )));
  }
}

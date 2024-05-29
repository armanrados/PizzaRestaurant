import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/providers/user_provider.dart';
import 'package:pizza_restaurant_ui/screens/order_screen.dart';
import 'package:pizza_restaurant_ui/screens/profile_modify_screen.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../utils/util.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = "/profile";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserProvider? _userProvider;
  User? user;

  @override
  void initState() {

    super.initState();
    _userProvider = context.read<UserProvider>();
    loadData();
  }

  Future loadData() async {
    var tmp =
        await _userProvider!.getById(Authorization.user!.userID!);
    setState(() {
      user = tmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.amber,
      ),
        body: SingleChildScrollView(
      child: Container(
        child: Column(children: [
         
          SizedBox(height: 40),
          Text("${Authorization.username}",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color:Colors.grey[900])),
          
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: buildUser(),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () async {
                    var refresh = await Navigator.pushNamed(context,
                        "${ProfileModifyScreen.routeName}/${Authorization.user!.userID}");
                    if (refresh == true) {
                      await loadData();
                    }
                  },
                  child: Text("Edit profile",
                      style: TextStyle(color: Colors.black))),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                  onPressed: () async {
                    Navigator.pushNamed(context, OrderScreen.routeName);
                  },
                  child: Text("My orders",
                      style: TextStyle(color: Colors.black)))
            ],
          )
        ]),
      ),
    ));
  }



  Widget buildUser() {
    if (user == null) {
      return Center(
        child: Text("Profile is loading.."),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name:', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 8),
          Container(
              width: 320,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.amber,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('${user!.name}',
                      style: TextStyle(fontSize: 18)))),
          SizedBox(height: 16),
          Text('Lastname:', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 8),
          Container(
              width: 320,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.amber,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('${user!.lastName}',
                      style: TextStyle(fontSize: 18)))),
          SizedBox(height: 16),
          Text('Email:', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 8),
          Container(
              width: 320,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.amber,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('${user!.email}',
                      style: TextStyle(fontSize: 18)))),
          SizedBox(height: 16),
          Text('Date of birth:', style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 8),
          Container(
              width: 320,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.amber,
                    width: 1,
                  ),
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text('${formatDate(user!.dateOfBirth!)}',
                      style: TextStyle(fontSize: 18)))),
        
        ],
      );
    }
  }
}

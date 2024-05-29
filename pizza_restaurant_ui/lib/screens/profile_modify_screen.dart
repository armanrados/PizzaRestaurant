import 'package:flutter/material.dart';
import 'package:pizza_restaurant_ui/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../utils/util.dart';

class ProfileModifyScreen extends StatefulWidget {
  static const String routeName = "/profile_modify";
  String id;
  ProfileModifyScreen(this.id, {Key? key}) : super(key: key);

  @override
  State<ProfileModifyScreen> createState() => _ProfileModifyScreenState();
}

class _ProfileModifyScreenState extends State<ProfileModifyScreen> {
  UserProvider? _userProvider;

  User? _user;

  TextEditingController _NameController = TextEditingController();
  TextEditingController _LastnameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
  
    super.initState();
    _userProvider = context.read<UserProvider>();

    loadData();
  }

  Future loadData() async {
    var tmpData = await _userProvider!.getById(int.parse(this.widget.id));
    setState(() {
      _user = tmpData;
      _EmailController.text = _user!.email!;
      _NameController.text = _user!.name!;
      _LastnameController.text = _user!.lastName!;
  
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My profile"),
          backgroundColor: Colors.amber,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(children: [
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: buildProfile(),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Map user = {
                              "name": _NameController.text,
                              "lastName": _LastnameController.text,
                              "email": _EmailController.text,
                            };
                            await _userProvider!.update(
                                Authorization.user!.userID!, user);
                            Navigator.pop(context, true);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Profile edit successfully"), backgroundColor:Colors.amber,));
                          }
                        },
                        child: Text("Save changes",
                            style: TextStyle(color: Colors.black)))
                  ],
                )
              ]),
            ),
          ),
        ));
  }

  Widget buildProfile() {
    if (_user == null) {
      return Center(
        child: Text("Loading"),
      );
    } else {
      return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                children: [
                  Text('Name:', style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
                width: 320,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name can not be empty";
                          } else if (value.length < 3) {
                            return "Name needs to containt more than 3 letters";
                          }
                          return null;
                        },
                        controller: _NameController,
                        style: TextStyle(fontSize: 18)))),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                children: [
                  Text('Lastname:',
                      style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
                width: 320,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Lastname can not be empty";
                          } else if (value.length < 3) {
                            return "Lastname needs to contain more than 3 letters";
                          }
                          return null;
                        },
                        controller: _LastnameController,
                        style: TextStyle(fontSize: 18)))),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Row(
                children: [
                  Text('Email:', style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
                width: 320,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email can not be empty";
                          }
                        },
                        controller: _EmailController,
                        style: TextStyle(fontSize: 18)))),
          
           
          ],
        ),
      );
    }
  }
}

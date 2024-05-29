import 'dart:convert';



import '../models/user.dart';
import 'base_provider.dart';

class UserProvider extends BaseProvider<User> {
    UserProvider(): super("User");

   @override
   User fromJson(data) {
    return User.fromJson(data);
  }
  Future <User> Authenticate() async
  {
    var url = "$fullUrl/Authenticate";
    var uri = Uri.parse(url);

    var headers = createHeaders();
    var response = await http!.get(uri , headers: headers);
    if(isValidResponse(response)){
      var data = jsonDecode(response.body);
      User user = fromJson(data) as User;
      return user;
    }
    else{
      throw Exception("Wrong username or password");
    }
  }
}
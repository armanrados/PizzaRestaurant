import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user.g.dart';

@JsonSerializable()
class User {
  int? userID;
  String? name;
  String? lastName;
  DateTime? dateOfBirth;
  String? email;
  String? username;
  String? password;
  int? roleID;

  String? roleNames;
  User(
      this.userID,
      this.name,
      this.lastName,
      this.dateOfBirth,
      this.email,
      this.username,
      this.roleID,
      this.password,
      this.roleNames);

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
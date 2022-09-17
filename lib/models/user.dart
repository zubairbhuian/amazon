import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.id,
    this.v,
    required this.token,
  });

  String name;
  String email;
  String password;
  String? address;
  String? type;
  String? id;
  int? v;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        address: json["address"],
        type: json["type"],
        id: json["_id"],
        v: json["__v"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "address": address,
        "type": type,
        "_id": id,
        "__v": v,
        "token": token,
      };
}

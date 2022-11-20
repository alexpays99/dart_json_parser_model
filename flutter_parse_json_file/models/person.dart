import 'friends.dart';
import 'user.dart';

abstract class Person {
  Person();

  factory Person.fromJson(Map<String, dynamic> json, String type) {
    switch (type) {
      case "User":
        return User.fromJson(json);
      case "Friend":
        return Friend.fromJson(json);
      default:
        return User.fromJson(json);
    }
  }

  static Map<String, dynamic>? toJson(Object? value, String type) {
    switch (type) {
      case "Friend":
        return Friend.toJson(value as Friend);
      case "User":
        return User.toJson(value as User);
      default:
        return null;
    }
  }
}

import 'dart:convert';
import '../helpers/json_writer.dart';
import 'person.dart';

class User extends Person with JsonWriter {
  final String name;
  final bool hasFriend;
  final int age;

  User({
    required this.name,
    required this.hasFriend,
    required this.age,
  }) : super();

  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String,
      hasFriend: json['hasFriend'] as bool,
      age: json['age'] as int);

  static Map<String, dynamic> toJson(User value) => {
        'name': value.name,
        'hasFriend': value.hasFriend,
        'age': value.age,
      };

  @override
  void writeFromJson() {}

  @override
  String writeToJson() {
    final jsonText = jsonEncode({
      'name': name,
      'hasFriend': hasFriend,
      "age": age,
    },
        toEncodable: (Object? value) => value is User
            ? User.toJson(value)
            : throw UnsupportedError('Cannot convert to JSON: $value'));
    return jsonText;
  }
}

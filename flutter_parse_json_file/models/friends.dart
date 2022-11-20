import 'dart:convert';
import '../helpers/json_writer.dart';
import 'person.dart';

class Friend extends Person with JsonWriter {
  final String name;
  final bool hasFriend;

  Friend({
    required this.name,
    required this.hasFriend,
  });

  factory Friend.fromJson(Map<String, dynamic> json) => Friend(
        name: json['name'] as String,
        hasFriend: json['hasFriend'] as bool,
      );

  static Map<String, dynamic> toJson(Friend value) => {
        'name': value.name,
        'hasFriend': value.hasFriend,
      };

  @override
  void writeFromJson() {}

  @override
  String writeToJson() {
    final jsonText = jsonEncode({'name': name, 'hasFriend': hasFriend},
        toEncodable: (Object? value) => value is Friend
            ? Friend.toJson(value)
            : throw UnsupportedError('Cannot convert to JSON: $value'));
    return jsonText;
  }
}

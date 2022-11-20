import 'dart:io';
import '../models/person.dart';
import 'json_writer.dart';

class Parser {
  Parser._privateConstructor();
  static final Parser instance = Parser._privateConstructor();

  // encode class model to json and write it in a separate .json file
  Future<void> parseModelToJson(JsonWriter model) async {
    final jsonText = model.writeToJson();
    print(jsonText);

    final fileModel = await File(
            'assets/${model.runtimeType.toString().toLowerCase()}_${DateTime.now()}.json')
        .create();
    await fileModel.writeAsString(jsonText.toString());
  }

  Object getObjectInstance({required Person obj, required String type}) {
    final res = Person.toJson(obj, type);
    final resultModel = Person.fromJson(res!, type);
    return resultModel;
  }
}

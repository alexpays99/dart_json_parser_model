import 'helpers/parser.dart';
import 'models/friends.dart';
import 'models/marshal_and_lilie.dart';
import 'models/user.dart';

void main() async {
  await task1();
  task2();
}

task1() async {
  final marshalAndLilie = MarshalAndLilie();

  await marshalAndLilie.decodeFriends();

  if (marshalAndLilie.friendsList.isNotEmpty) {
    marshalAndLilie.showSentInvitesInfo();
  } else {
    print('List is empty');
  }
}

task2() {
  final parser = Parser.instance;

  final user = parser.getObjectInstance(
      obj: User(name: "fff", hasFriend: true, age: 23), type: "User") as User;
  final friend = parser.getObjectInstance(
      obj: Friend(name: "fff", hasFriend: true), type: "Friend") as Friend;

  parser.parseModelToJson(user);
  parser.parseModelToJson(friend);
}

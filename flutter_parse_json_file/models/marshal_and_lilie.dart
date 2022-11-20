import 'dart:convert';
import 'dart:io';
import 'friends.dart';

class MarshalAndLilie {
  late List<Friend> friendsList;
  int initialSum = 0;

  // parse json data from file, and put them to list
  Future<void> decodeFriends() async {
    final fileInput = await File('assets/friends.json').readAsString();
    final friends = await jsonDecode(fileInput) as List<dynamic>;
    friendsList = friends.map((dynamic e) => Friend.fromJson((e as Map<String, dynamic>))).toList();
  }

  void showSentInvitesInfo() {
    var amountOfGuests = 2; // Marshal and Lilie
    var hosts = 0;
    
    for (dynamic e in friendsList) {
      if(e.hasFriend == true) {
        amountOfGuests += 1;
        print('${e.name}+one, guests: 1');
      } else {
        print('${e.name}, guests: 0');
      }
        amountOfGuests +=  1;
    }
    
    if (amountOfGuests == 13) { 
        hosts++;
      initialSum += 100*amountOfGuests + 100;
    } else {
      initialSum += 100*amountOfGuests;
    }
  
    print('Participants = $amountOfGuests, Sum = $initialSum, hosts: $hosts');
  }
}
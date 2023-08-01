import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  User({required this.name, required this.surname});
  String name;
  String surname;

  get fullname => "$name $surname";

  set setName(String newName) {
    name = newName;
  }
}

User _dumbUser = User(name: "Paul", surname: "Dupont");

final userProvider = Provider<User>((ref) => _dumbUser);

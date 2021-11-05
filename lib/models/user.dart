import 'dart:collection';

import 'package:salongly/app/enums.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String phoneNumber;
  UserType userType;
  List<String>? haircutsHistoryIds;

  User({
    this.id = '',
    this.name = '',
    this.phoneNumber = '',
    this.haircutsHistoryIds,
    this.email = '',
    this.password = '',
    this.userType = UserType.client,
  });
}

extension userMap on User {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'haircutsHistoryIds': haircutsHistoryIds ?? [],
      'userType': userType.toString(),
    };
  }

  User fromJson(Map json) {
    return User(
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      haircutsHistoryIds: json['haircutsHistoryIds'] ?? [],
      userType: UserType.client
          .fromString(json['userType'] ?? UserType.client.toString()),
    );
  }
}

extension validation on User {
  List<String> validateLogin() {
    List<String> errors = [];
    if (!this.email.contains('@')) {
      errors.add('Ogiltigt e-post adress');
    }
    if (this.password.length < 7) errors.add('Ogiltigt lösenord');

    return errors;
  }

  List<String> validateUser() {
    List<String> errors = [];

    errors.addAll(validateLogin());

    if (this.name.isEmpty) errors.add('Ogiltigt namn');

    if (this.phoneNumber.length != 10) errors.add('Ogiltigt mobil nummer');

    return errors;
  }
}

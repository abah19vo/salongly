
import 'package:json_annotation/json_annotation.dart';
import 'package:salongly/app/enums.dart';
part 'generated/user.g.dart';

@JsonSerializable()
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
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

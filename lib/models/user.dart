class User {
  String id;
  String name;
  String email;
  String password;
  String phoneNumber;
  List<String>? haircutsHistoryIds;
  User({
    this.id = '',
    this.name = '',
    this.phoneNumber = '',
    this.haircutsHistoryIds,
    this.email = '',
    this.password = '',
  });

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'haircutsHistoryIds': haircutsHistoryIds,
    };
  }

  User fromJson(Map json) {
    return User(
      email: json['email'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      haircutsHistoryIds: json['haircutsHistoryIds'] ?? [],
    );
  }

  List<String> validateLogin() {
    List<String> errors = [];
    if (email.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      errors.add('Ogiltigt e-post adress');
    }
    if (password.length < 8) errors.add('Ogiltigt lösenord');

    return errors;
  }

  List<String> validateUser() {
    List<String> errors = [];
    if (email.contains(RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
      errors.add('Ogiltigt e-post adress');
    }
    if (password.length < 8) errors.add('Ogiltigt lösenord');

    if (name.isEmpty) errors.add('Ogiltigt namn');

    if (phoneNumber.length != 10 || phoneNumber.length != 12)
      errors.add('Ogiltigt mobil nummer');

    return errors;
  }
}

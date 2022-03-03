
enum UserType {
  admin,
  client,
}



extension UserTypeFromString on UserType {
  UserType fromString(String type) {
    return UserType.values.firstWhere((element) => element.toString() == type);
  }

  String toShortString() {
    return this.toString().split('.').last;
  }
}


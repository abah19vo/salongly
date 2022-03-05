
enum UserType {
  admin,
  client,
}

enum HaircutType {
  child,
  women,
  man,
}

extension EnumFuncs on Enum {
  UserType fromString(String type) {
    return UserType.values.firstWhere((element) => element.toString() == type);
  }

  String toShortString() {
    return this.toString().split('.').last;
  }
}


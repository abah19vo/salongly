enum UserType {
  admin,
  client,
}


extension UserTypeFromString on UserType {
  UserType fromString(String type) {
    Map types = {
      'admin': UserType.admin,
      'client': UserType.client,
    };

    return types[type];
  }
}

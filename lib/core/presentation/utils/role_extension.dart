extension RoleExtension on String {
  RoleType toRoleEnum() {
    switch (this) {
      default:
        return RoleType.user;
    }
  }

  String toLiteralValue() {
    switch (this) {
      default:
        return 'Usuario';
    }
  }
}

enum RoleType {
  user,
}

extension ExtensionString on String {
  bool get isValidPassword {
    final passwordRegExp = RegExp(r"^([a-zA-Z0-9.]{6,20})+$");
    return passwordRegExp.hasMatch(this);
  }
}

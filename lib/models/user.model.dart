class UserModel {
  String fullName = "";
  String email = "";

  UserModel({this.fullName = "", this.email = ""});

  String get firstName => fullName.split(" ").first;

  UserModel.fromFirestore(Map<String, dynamic> map) {
    fullName = map["full_name"] ?? "";
    email = map["email"] ?? "";
  }

  Map<String, dynamic> toMap() {
    return {"full_name": fullName, "email": email};
  }
}

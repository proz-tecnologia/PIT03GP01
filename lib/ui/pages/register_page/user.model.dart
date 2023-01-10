class UserModel {
  String fullName = "";
  String email = "";
  String phoneNumber = "";
  UserModel({this.fullName = "", this.email = "", this.phoneNumber = ""});

  String get firstName => fullName.split(" ").first;

  UserModel.fromFirestore(Map<String, dynamic> map) {
    fullName = map["full_name"] ?? "";
    email = map["email"] ?? "";
    phoneNumber = map["telefone"];
  }

  Map<String, dynamic> toMap() {
    return {"full_name": fullName, "email": email, "phone_number": phoneNumber};
  }
}

class UserModel {
  final int id;
  final String? firstnName;
  final String? email;

  UserModel({required this.id, required this.firstnName, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      firstnName: json["firstName"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'firstName': firstnName, 'email': email};
  }
}

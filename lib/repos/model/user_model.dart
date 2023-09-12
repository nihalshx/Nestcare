class UserModel {
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userId;

  UserModel({
    required this.userName,
    required this.userEmail,
    required this.userId,
    required this.userPassword,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userName: json["userName"],
        userEmail: json["userEmail"],
        userId: json["userId"],
        userPassword: json["userPassword"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userEmail": userEmail,
        "userId": userId,
        "userPassword": userPassword,
      };
}

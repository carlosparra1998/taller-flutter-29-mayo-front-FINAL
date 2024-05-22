class User {
  String? userName;
  String? accessToken;
  String? refreshToken;

  User({
    required this.userName,
    required this.accessToken,
    required this.refreshToken,
  });

  User.fromJson(Map<String, dynamic> json, String userName) {
    userName = userName;
    accessToken = json["access_token"];
    refreshToken = json["refresh_token"];
  }
}

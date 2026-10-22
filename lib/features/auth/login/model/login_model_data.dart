class LoginModelData {
  String? accessToken;
  String? refreshToken;

  LoginModelData({this.accessToken, this.refreshToken});

  LoginModelData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}

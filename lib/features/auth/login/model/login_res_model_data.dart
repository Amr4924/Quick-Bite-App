class LoginResModelData {
  String? accessToken;
  String? refreshToken;

  LoginResModelData({this.accessToken, this.refreshToken});

  LoginResModelData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }
}

class LoginResponseModel {
  final String accessToken;

  LoginResponseModel({required this.accessToken});
  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(accessToken: json['accessToken']);
}

// mengkonversi dari json ke model

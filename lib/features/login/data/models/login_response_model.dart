class LoginResponseModel {
  final User user;
  final Tokens tokens;

  LoginResponseModel({required this.user, required this.tokens});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      user: User.fromJson(json['user']),
      tokens: Tokens.fromJson(json['tokens']),
    );
  }
}

class User {
  final String id;
  final String name;
  final String phone;
  final String profilePictureUrl;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    phone: json['phone'],
    profilePictureUrl: json['profile_picture_url'],
  );
}

class Tokens {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  Tokens({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    accessToken: json['access_token'],
    refreshToken: json['refresh_token'],
    tokenType: json['token_type'],
    expiresIn: json['expires_in'],
  );
}

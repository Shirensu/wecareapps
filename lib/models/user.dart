class User {
  final int id;
  final String username;
  final String email;
  final String token;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['UserId'],
      username: json['UserName'],
      email: json['UserEmail'],
      token: json['Token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'UserId': id,
      'UserName': username,
      'UserEmail': email,
      'Token': token,
    };
  }
}

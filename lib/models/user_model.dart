class UserModel {
  final String username;
  final String email;
  final String uid;
  final String uniqueId;

  UserModel({
    required this.username,
    required this.email,
    required this.uid,
    required this.uniqueId,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'uid': uid,
        'uniqueId': uniqueId,
      };

  static UserModel fromJson(Map<String, dynamic> json) => UserModel(
        username: json['username'],
        email: json['email'],
        uid: json['uid'],
        uniqueId: json['uniqueId'],
      );
}

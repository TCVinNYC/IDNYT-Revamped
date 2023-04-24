class UserModel {
  final String email;
  final String fullName;
  final String role;
  final Map schoolCard;
  final String schoolID;
  final String profilePicture;

  UserModel({
    required this.email,
    required this.fullName,
    required this.role,
    required this.schoolCard,
    required this.schoolID,
    required this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['email'] ?? '',
        fullName: json['fullName'] ?? '',
        role: json['role'] ?? '',
        schoolCard: json['schoolCard'] ?? {},
        schoolID: json['schoolID'] ?? '',
        profilePicture: json['profilePicture'] ?? '');
  }
}

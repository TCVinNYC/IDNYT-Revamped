class User {
  final String id;
  final String email;
  final String fullName;
  final String role;
  final Map courses;
  final Map schoolCard;
  final String schoolID;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    required this.courses,
    required this.schoolCard,
    required this.schoolID,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      role: json['role'],
      courses: json['courses'],
      schoolCard: json['schoolCard'],
      schoolID: json['schoolID'],
    );
  }
}

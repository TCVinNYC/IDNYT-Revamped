class StudentAttendanceModel {
  final String name;
  final String email;
  final String profilePicture;
  final String time;

  StudentAttendanceModel({
    required this.name,
    required this.email,
    required this.profilePicture,
    required this.time,
  });

  factory StudentAttendanceModel.fromJson(
      Map<String, dynamic> json, String email) {
    return StudentAttendanceModel(
      name: json['name'] ?? '',
      email: email,
      profilePicture: json['profilePicture'] ?? '',
      time: json['time'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['time'] = time;
    data['profilePicture'] = profilePicture;
    return data;
  }
}

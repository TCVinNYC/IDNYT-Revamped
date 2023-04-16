class CourseModel {
  final String id;
  final String professorEmail;
  final String professorFullName;
  final String professorPicture;
  final String courseName;
  final String courseCode;
  final String semester;
  final String location;
  final List<String> courseDaysList;
  final String courseTime;
  final List<String> studentList;

  CourseModel({
    required this.id,
    required this.professorEmail,
    required this.professorFullName,
    required this.professorPicture,
    required this.courseName,
    required this.courseCode,
    required this.semester,
    required this.location,
    required this.courseDaysList,
    required this.courseTime,
    required this.studentList,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      professorEmail: json['professorEmail'] ?? '',
      professorFullName: json['professorFullName'] ?? '',
      professorPicture: json['professorPicture'] ?? '',
      courseName: json['courseName'] ?? '',
      courseCode: json['courseCode'] ?? '',
      semester: json['semester'] ?? '',
      location: json['location'] ?? '',
      courseDaysList: json['courseDaysList'].cast<String>() ?? [],
      courseTime: json['courseTime'] ?? '',
      studentList: json['studentList'].cast<String>() ?? [],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

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

  bool isCourseLocation(String scannedLocation) {
    // Check if the scanned location matches the course location
    return scannedLocation == location;
  }

  bool isCourseOngoing() {
    final now = DateTime.now();
    final currentDay = DateFormat('EEEE')
        .format(now); // EEEE represents the full name of the day
    final currentTime = TimeOfDay.fromDateTime(now);

    // Check if today is one of the course days
    if (!courseDaysList.contains(currentDay)) {
      return false;
    }

    // Check if the current time falls within the course time
    final courseTimeParts = courseTime.split('-');
    final courseStartTime = TimeOfDay.fromDateTime(
        DateFormat('h:mm a').parse(courseTimeParts[0].trim()));
    final courseEndTime = TimeOfDay.fromDateTime(
        DateFormat('h:mm a').parse(courseTimeParts[1].trim()));
    if (currentTime.hour < courseStartTime.hour ||
        currentTime.hour > courseEndTime.hour) {
      return false;
    }
    if (currentTime.hour == courseStartTime.hour &&
        currentTime.minute < courseStartTime.minute) {
      return false;
    }
    if (currentTime.hour == courseEndTime.hour &&
        currentTime.minute > courseEndTime.minute) {
      return false;
    }

    // All conditions met
    return true;
  }
}

/*
  This is the user model for the current user
*/

class User {
  int id; // Student ID
  String firstName = "";
  String lastName = "";
  String email = "";
  bool isLoggedIn = false;

  User(
      {this.id = 0,
      this.firstName = "",
      this.lastName = "",
      this.email = "",
      this.isLoggedIn = false});
}

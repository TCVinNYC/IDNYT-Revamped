bool isEmailValid(String email) {
  // Check if email is null or empty
  if (email == null || email.isEmpty) {
    return false;
  }

  // Check if email matches the regex pattern
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email.trim());
}

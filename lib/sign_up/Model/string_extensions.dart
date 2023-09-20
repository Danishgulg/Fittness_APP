extension Validation on String? {
  bool isEmail(String input) {
    // Define a regular expression pattern for matching email addresses
    RegExp emailPattern = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');

    // Use the RegExp pattern to check if the input matches the email pattern
    return emailPattern.hasMatch(input);
  }

  String? isStrongPassword(String password) {
    // Define the password criteria using regular expressions
    RegExp digitPattern = RegExp(r'[0-9]');
    RegExp uppercasePattern = RegExp(r'[A-Z]');
    RegExp lowercasePattern = RegExp(r'[a-z]');
    RegExp specialCharacterPattern = RegExp(r'[!@#$%^&*()_+{}\[\]:;<>,.?~\\-]');

    // Check if the password meets the criteria
    if (password.length < 8) {
      return 'must contain eight character';
    } // Minimum length requirement
    else if (!digitPattern.hasMatch(password)) {
      return 'must contain digit';
    } else if ( // At least one digit
        !uppercasePattern.hasMatch(password)) {
      return 'must contain uppercase letter';
    } else if ( // At least one uppercase letter
        !lowercasePattern.hasMatch(password)) {
      return 'must contain lower case letter';
    } else if ( // At least one lowercase letter
        !specialCharacterPattern.hasMatch(password)) {
      return 'must contain a special character';
    } else {
      return null;
    }
  }
}

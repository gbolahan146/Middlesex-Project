class Validators {
  static String emailValidator(value) {
    if (value.isEmpty) {
      return 'Email cannot be empty';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Correct Email needed';
    }
    return null;
  }

    static String emptyValidator(value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    
    return null;
  }

  static String passwordValidator(value) {
    if (value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password cannot be less than 6 characters';
    }
    return null;
  }
}

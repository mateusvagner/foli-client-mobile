class TextFormFieldValidator {
  static bool _isNullOrEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static bool _isValidEmail(String value) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
  }

  static bool _isValidPassword(String value) {
    // r'^
    //   (?=.*?[A-Z])       // should contain at least one upper case
    //   (?=.*?[a-z])       // should contain at least one lower case
    //   (?=.*?[0-9])      // should contain at least one digit
    //   (?=.*?[!@#\$&*~]) // should contain at least one Special character
    //   .{8,}             // Must be at least 8 characters in length
    // $

    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value);
  }

  static String? requiredField(String? value) {
    if (_isNullOrEmpty(value)) {
      return 'Esse campo é obrigatório';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (_isNullOrEmpty(value)) {
      return 'Você deve preencher seu e-mail';
    }

    if (!_isValidEmail(value!)) {
      return 'Você deve inserir um e-mail válido';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (_isNullOrEmpty(value)) {
      return 'Você deve fornecer uma senha';
    }

    if (!_isValidPassword(value!)) {
      return 'Informe uma senha válida';
    }

    return null;
  }
}

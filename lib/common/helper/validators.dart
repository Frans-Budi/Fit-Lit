import 'package:fit_lit/common/utils/app_constants.dart';

class Validators {
  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return AppConstants.ERR_NAME_MUST_FILLED;
    }
    if (val.length < 3 || val.length > 50) {
      return AppConstants.ERR_NAME_LENGTH;
    }
    if (!RegExp(r'^[a-z A-Z]+$').hasMatch(val.trimRight())) {
      return AppConstants.ERR_NAME_MUST_LETTERS;
    }
    return null;
  }

  static String? validateUsername(String? val) {
    if (val == null || val.isEmpty) {
      return AppConstants.ERR_USERNAME_MUST_FILLED;
    }
    if (val.length < 3 || val.length > 30) {
      return AppConstants.ERR_USERNAME_LENGTH;
    }
    if (!RegExp(r"^[a-zA-Z][a-zA-Z0-9_.]{2,29}$").hasMatch(val.trim())) {
      return AppConstants.ERR_USERNAME_FORMAT;
    }
    return null;
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return AppConstants.ERR_PASSWORD_MUST_FILLED;
    }
    if (val.length < 8) {
      return AppConstants.ERR_PASSWORD_LENGTH;
    }
    if (!RegExp(r'^(?=.*\d)(?=.*[@$!%*?&#()])').hasMatch(val)) {
      return AppConstants.ERR_PASSWORD_FORMAT;
    }
    if (RegExp(r'\s').hasMatch(val)) {
      return AppConstants.ERR_PASSWORD_NO_SPACE;
    }
    return null;
  }

  static String? validateConfirmPass(String? val, String password) {
    if (val == null || val.isEmpty) {
      return AppConstants.ERR_PASSWORD_MUST_FILLED;
    }
    if (val != password) {
      return AppConstants.ERR_CONFIRM_PASSWORD;
    }
    return null;
  }
}

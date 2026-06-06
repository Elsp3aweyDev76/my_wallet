class Validator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Amount is required';
    }
    final amount = double.tryParse(value);
    if (amount == null || amount <= 0) {
      return 'Enter a valid positive amount';
    }
    return null;
  }

  // static String? validateRealName(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Real name is required';
  //   }
  //   final parts = value.trim().split(RegExp(r'\s+'));
  //   if (parts.length < 2) {
  //     return 'Please enter your full name (first and last)';
  //   }
  //   for (var part in parts) {
  //     if (!RegExp(r'^[a-zA-Z]+$').hasMatch(part)) {
  //       return 'Name should only contain letters';
  //     }
  //   }
  //   return null;
  // }
}

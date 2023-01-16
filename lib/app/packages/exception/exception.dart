class SignUpWithEmailAndPassword implements Exception {
  const SignUpWithEmailAndPassword(this.message);

  final String message;
}

class LogInWithEmailAndPassword implements Exception {
  const LogInWithEmailAndPassword(this.message);

  final String message;
}

class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure(this.message);

  final String message;
}

class PasswordResetFailure implements Exception {
  const PasswordResetFailure(this.message);

  final String message;
}

class LogOutFailure implements Exception {}

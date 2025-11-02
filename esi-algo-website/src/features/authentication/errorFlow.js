export class AuthError {
  constructor(title, text) {
    this.title = title;
    this.text = text;
  }

  static from(exception) {
    const errorCode = exception.code;
    return authErrorMapping[errorCode] || new AuthErrorUnknown();
  }

  static fromLogin(exception) {
    return authErrorMapping[exception];
  }
}

class AuthErrorUnknown extends AuthError {
  constructor() {
    super("Authentication error", "Unknown authentication error");
  }
}

class AuthErrorNoCurrentUser extends AuthError {
  constructor() {
    super(
      "No current user!",
      "No current user with this information was found!"
    );
  }
}

class AuthErrorRequiresRecentLogin extends AuthError {
  constructor() {
    super(
      "Requires recent login",
      "You need to log out and log back in again in order to perform this operation"
    );
  }
}

class AuthErrorOperationNotAllowed extends AuthError {
  constructor() {
    super(
      "Operation not allowed",
      "You cannot register using this method at this moment!"
    );
  }
}

class AuthErrorUserNotFound extends AuthError {
  constructor() {
    super("User not found", "The given user was not found on the server!");
  }
}

class AuthErrorWeakPassword extends AuthError {
  constructor() {
    super(
      "Weak password",
      "Please choose a stronger password consisting of more characters!"
    );
  }
}

class AuthErrorInvalidEmail extends AuthError {
  constructor() {
    super("Invalid email", "Please double check your email and try again!");
  }
}

class AuthErrorEmailAlreadyInUse extends AuthError {
  constructor() {
    super(
      "Email already in use",
      "Please choose another email to register with!"
    );
  }
}

class AuthErrorEmailNotVerified extends AuthError {
  constructor() {
    super("Email not verified", "Please verify your email to login");
  }
}

class AuthErrorInvalidLoginCredentials extends AuthError {
  constructor() {
    super(
      "Invalid login credentials",
      "Please verify your email and password to login"
    );
  }
}

class AuthErrorTooManyRequests extends AuthError {
  constructor() {
    super(
      "Account Temporarily Disabled",
      "Access disabled due to multiple failed attempts. Reset password or retry later."
    );
  }
}

const authErrorMapping = {
  "auth/user-not-found": new AuthErrorUserNotFound(),
  "auth/weak-password": new AuthErrorWeakPassword(),
  "auth/invalid-email": new AuthErrorInvalidEmail(),
  "auth/invalid-login-credentials": new AuthErrorInvalidLoginCredentials(),
  "auth/operation-not-allowed": new AuthErrorOperationNotAllowed(),
  "auth/email-already-in-use": new AuthErrorEmailAlreadyInUse(),
  "auth/requires-recent-login": new AuthErrorRequiresRecentLogin(),
  "auth/no-current-user": new AuthErrorNoCurrentUser(),
  // "auth/email-not-verified": new AuthErrorEmailNotVerified(),
  "auth/too-many-requests": new AuthErrorTooManyRequests(),
};

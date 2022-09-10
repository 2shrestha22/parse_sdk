import 'dart:convert';

import 'package:http/http.dart' show Response;
import 'package:parse_dart/parse_dart.dart';
import 'package:parse_dart/src/service.dart';

/// Allows to perform Authentication related actions.
class Auth extends Service {
  /// Allows to perform Authentication related actions.
  Auth() : super(ParseClient.instance);

  /// Signup a user with username and password.
  ///
  /// User can be also created without email.
  Future<Response> signup({
    required String username,
    required String password,
    String? email,
  }) {
    return post(
      path: '/users',
      data: {
        'username': username,
        'password': password,
        'email': email,
      },
    );
  }

  /// Login a user with username and password.
  Future<Response> login({
    required String username,
    required String password,
  }) {
    return post(
      path: '/login',
      data: {
        'username': username,
        'password': password,
      },
    );
  }

  /// Note that a verification email will not be sent if the email has already
  /// been successfully verified.
  Future<void> verifyEmail(String email) {
    return post(path: '/verificationEmailRequest', data: {'email': email});
  }
}

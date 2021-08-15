import 'dart:convert';

import 'package:asthma_management/core/services/snackbarService.dart';
import 'package:asthma_management/views/login/utils/login_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

enum ButtonStates {
  Idle,
  Pressed,
}

class LoginViewModel extends ChangeNotifier {
  LoginViewModel();

  ButtonStates _buttonState = ButtonStates.Idle;

  ButtonStates get buttonStates => _buttonState;

  void setState(ButtonStates buttonState) {
    _buttonState = buttonState;
    notifyListeners();
  }

  Future<String> login(String email, String password) async {
    setState(ButtonStates.Pressed);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    Map data = {"email": email, "password": password};
    String payload = json.encode(data);
    Response response = await http.post(
      loginUrl,
      headers: headers,
      body: payload,
    );


    if (response.statusCode == 200) {
      final Map feedback = json.decode(response.body);
      // final Map token = feedback['data'];
      String apiKey = feedback['token'].toString();
      SnackBarService.instance.showSnackBarSuccess('Login Successful');
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString('token', apiKey);
      setState(ButtonStates.Idle);


      return apiKey;
    } else if (response.statusCode == 500) {
      setState(ButtonStates.Idle);
      final Map error = json.decode(response.body);
      SnackBarService.instance
          .showSnackBarError(error['error'] ?? 'Server error');
      return null;
    } else if (response.statusCode == 401) {
      setState(ButtonStates.Idle);
      final Map error = json.decode(response.body);
      SnackBarService.instance
          .showSnackBarError(error['error'] ?? 'UnAuthorized User');
      return null;
    } else if (response.statusCode == 302) {
      setState(ButtonStates.Idle);
      return 'Profile';
    } else {

      setState(ButtonStates.Idle);
      final Map error = json.decode(response.body);
      SnackBarService.instance
          .showSnackBarError(error['error'] ?? 'Check your email or password');

      return null;
    }
  }
}

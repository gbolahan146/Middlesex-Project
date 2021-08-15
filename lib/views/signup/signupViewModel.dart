

import 'dart:convert';

import 'package:asthma_management/core/services/snackbarService.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



enum ButtonState {
  Idle,
  Pressed
}

class SignupViewModel extends ChangeNotifier {
  SignupViewModel();
  
  ButtonState _buttonState = ButtonState.Idle;

  ButtonState get buttonState => _buttonState;

  void setState(ButtonState buttonState) {
    _buttonState = buttonState;
    notifyListeners();
  }

  
  Future<String> signup(String username, String email, String password) async {
    setState(ButtonState.Pressed);
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    Map data = {"name": username, "email": email, "password": password};
    String payload = json.encode(data);
    Response response =
        await http.post('http://asthmgt.cuupschool.live/api/register', headers: headers, body: payload);

    if (response.statusCode == 500) {
      setState(ButtonState.Idle);
      final Map error = json.decode(response.body);
      SnackBarService.instance.showSnackBarError(error['error'] ?? 'Server error');
      return null;
    } else if (response.statusCode == 422) {
      setState(ButtonState.Idle);
      final Map error = json.decode(response.body);
      SnackBarService.instance
          .showSnackBarError(error['errors']['email'][0] ?? 'User already exists');
      return null;
    } else if (response.statusCode == 200) {
      final Map feedback = json.decode(response.body);
      final Map user = feedback['data'];
      String apiKey = user['id'].toString();
    
      SnackBarService.instance
          .showSnackBarSuccess('Account created for ${user['name']}');
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString('userID', apiKey);
      await preferences.setString('username', user['name']);
      setState(ButtonState.Idle);


      return apiKey;
    }

    setState(ButtonState.Idle);
    final Map error = json.decode(response.body);
    SnackBarService.instance.showSnackBarError(error['error'] ?? 'Server error');
    return null;
  }
}


import 'package:asthma_management/views/login/loginViewModel.dart';
import 'package:asthma_management/views/signup/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile2ViewModel with ChangeNotifier {
  Profile2ViewModel();

  int _number = 1;
  int get number => _number;

  List<bool> _trigger = [false, false, false, false, false, false];
  List<bool> _symptoms = [false, false, false, false, false, false];

  List<String> _triggerNames = [];
  List<String> _symptomNames = [];

  List<String> _phone = ["", "", ""];
  List<String> get phone => _phone;

  List<bool> get trigger => _trigger;
  List<String> get triggerNames => _triggerNames;

  List<bool> get symptoms => _symptoms;
  List<String> get symptomNames => _symptomNames;
  String _name;

  String get name => _name;

  ButtonStates _buttonState = ButtonStates.Idle;

  ButtonStates get buttonStates => _buttonState;

  void setState(ButtonStates buttonState) {
    _buttonState = buttonState;
    notifyListeners();
  }

  void addTrigger(String name) {
    _triggerNames.add(name);
    notifyListeners();
  }

  void removeTrigger(String name) {
    _triggerNames.remove(name);
    notifyListeners();
  }

   Future<void> getName() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name');

    notifyListeners();
  }

  void addSymptoms(String name) {
    _symptomNames.add(name);
    notifyListeners();
  }

  void removeSymptoms(String name) {
    _symptomNames.remove(name);
    notifyListeners();
  }

  void addNumber(String phone, int index) {
    _phone[index] = phone;
    notifyListeners();
  }

  void setBool(int index, String name) {
    _trigger[index] = !_trigger[index];
    if (_trigger[index] == true) {
      addTrigger(name);
    } else {
      removeTrigger(name);
    }
    notifyListeners();
  }

  void setSymptomBool(int index, String name) {
    _symptoms[index] = !_symptoms[index];
    if (_symptoms[index] == true) {
      addSymptoms(name);
    } else {
      removeSymptoms(name);
    }
    notifyListeners();
  }

  void increment() {
    _number <= 2
        ? _number++
        : Get.snackbar('Hey there', 'Maximum of $_number contacts allowed',
            snackPosition: SnackPosition.TOP,
            snackStyle: SnackStyle.FLOATING,
            leftBarIndicatorColor: buttonColor,
            backgroundColor: Colors.lightGreen,
            borderRadius: 0,
            duration: Duration(seconds: 4),
            icon: Icon(Icons.error)
            // backgroundColor: buttonColor
            );
    notifyListeners();
  }

  void decrement() {
    _number--;
    notifyListeners();
  }
}

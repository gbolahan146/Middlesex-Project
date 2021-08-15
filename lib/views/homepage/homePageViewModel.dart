import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewModel with ChangeNotifier {
  HomePageViewModel();
  String _name;
  String _image;
  String _greetings = '';

  String get name => _name;
  String get image => _image;
  String get greetings => _greetings;

  Future<void> getName() async {
    final prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name');
    greeting();
    notifyListeners();
  }

  Future<void> getImage() async {
    final prefs = await SharedPreferences.getInstance();
    _image = prefs.getString('image');
    notifyListeners();
  }

  void greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      _greetings = 'Good morning,';
    } else if (hour < 17) {
      _greetings = 'Good afternoon,';
    } else {
      _greetings = 'Good evening';
    }
  }
}

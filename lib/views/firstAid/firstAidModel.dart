
import 'package:flutter/cupertino.dart';

class FirstAidViewModel with ChangeNotifier {
  bool _emergency = false;
  bool _first = false;
  bool _second = false;
  bool _third = false; 
  bool _fourth = false;

  bool get fourth => _fourth; 
  bool get third => _third;
  bool get second => _second;
  bool get first => _first;
  bool get emergency => _emergency;

  void setEmergency(){
    _emergency = !_emergency;
    notifyListeners();
  }

  void setFirst(){
    _first = !_first;
    notifyListeners();
  }

  void setSecond(){
    _second = !_second;
    notifyListeners();
  }

  void setThird(){
    _third = !_third;
    notifyListeners();
  }

  void setFourth(){
    _fourth = !_fourth;
    notifyListeners();
  }
}


import 'package:flutter/cupertino.dart';

class ActionPlanViewModel with ChangeNotifier {
  bool _greenButton = false;
  bool get greenButton => _greenButton;

  bool _yellowButton = false;
  bool get yellowButton => _yellowButton;

  bool _redButton = false;
  bool get redButton => _redButton;

  List<bool> _zones = [true, false, false];

  List<bool> get zones => _zones;

  void setGreenButton(){
    _greenButton = !_greenButton;
    notifyListeners();
  }

  void setYellowButton(){
    _yellowButton = !_yellowButton;
    notifyListeners();
  }

  void setRedButton(){
    _redButton = !_redButton;
    notifyListeners();
  }

  void setRedZone(){
    _zones = [false, false, true];
    notifyListeners();
  }

  void setYellowZone(){
    _zones = [false, true, false];
    notifyListeners();
  }

  void setGreenZone(){
    _zones = [true, false, false];
    notifyListeners();
  }
}
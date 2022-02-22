import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  int _numAvatar = 1;
  int get numAvatar => _numAvatar;

  final ctrlUsuario = TextEditingController();

  set numAvatar(int val) {
    _numAvatar = val;
    notifyListeners();
  }
}

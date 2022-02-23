import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestivity/src/home/ui/home_page.dart';
import 'package:gestivity/src/login/ui/login_page.dart';
import 'package:gestivity/src/model/user_model.dart';

class LoginProvider extends ChangeNotifier {
  int _numAvatar = 1;
  int get numAvatar => _numAvatar;

  final ctrlUsuario = TextEditingController();
  final ctrlNombre = TextEditingController();
  final ctrlPassword = TextEditingController();

  final globalKey = GlobalKey<FormState>();

  set numAvatar(int val) {
    _numAvatar = val;
    notifyListeners();
  }

  List<UserModel> user = [];

  void register(BuildContext context) {
    if (globalKey.currentState!.validate()) {
      user.add(
        UserModel(
            name: ctrlNombre.text,
            user: ctrlUsuario.text,
            password: ctrlPassword.text,
            avatar: _numAvatar),
      );
      Navigator.pop(context);
      ctrlNombre.clear();
      ctrlUsuario.clear();
      ctrlPassword.clear();
    }
  }

  void login(BuildContext context) {
    for (final i in user) {
      if (ctrlUsuario.text == i.user && ctrlPassword.text == i.password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Usuario Incorrecto'),
          ),
        );
      }
    }
  }
}

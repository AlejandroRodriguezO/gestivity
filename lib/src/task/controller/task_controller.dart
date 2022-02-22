import 'package:flutter/cupertino.dart';
import 'package:gestivity/src/model/task_model.dart';

class TaskController extends ChangeNotifier {
  List<CategoryModel> category = [];
  final ctrlCategory = TextEditingController();

  int _numColor = 0;
  int get numColor => _numColor;

  set numColor(int val) {
    _numColor = val;
    notifyListeners();
  }

  void submit(BuildContext context) {
    final categoryModel =
        CategoryModel(title: ctrlCategory.text, color: _numColor);
    category.add(categoryModel);
    Navigator.of(context).pop();
    ctrlCategory.clear();
    numColor = 0;
  }
}

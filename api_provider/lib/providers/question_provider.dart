import 'package:api_provider/models/category_model.dart';
import 'package:api_provider/services/quiz_category.dart';
import 'package:flutter/cupertino.dart';

class QuestionProvider extends ChangeNotifier {
  QuestionProvider() {
    setQuestions();
  }
  List<Category> categories = [];
  List<Category> get getCategories => categories;

  void setQuestions() async {
    await CategoryServices().fetchCategories().then((value) {
      categories = value;
    });
    notifyListeners();
  }

  void addCategory(String categoryName) async {
    await CategoryServices().addCategory(categoryName);
  }



}

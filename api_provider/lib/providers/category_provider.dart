import 'package:api_provider/models/category_model.dart';
import 'package:api_provider/services/quiz_category.dart';
import 'package:flutter/cupertino.dart';

class CategoryProvider extends ChangeNotifier {
  CategoryProvider() {
    setCategories();
  }
  List<Category> categories = [];
  List<Category> get getCategories => categories;

  void setCategories() async {
    await CategoryServices().fetchCategories().then((value) {
      categories = value;
    });
    notifyListeners();
  }

  void addCategory(String categoryName) async {
    await CategoryServices().addCategory(categoryName);
    refreshCategories();
  }

  void updateCategory(String categoryId, String categoryName) async {
    await CategoryServices().updateCategory(categoryId, categoryName);
    refreshCategories();
  }

  void deleteCategory(String categoryId) async {
    await CategoryServices().deleteCategory(categoryId);
    refreshCategories();
    notifyListeners();
  }

  void refreshCategories() {
    setCategories();
    notifyListeners();
  }
}

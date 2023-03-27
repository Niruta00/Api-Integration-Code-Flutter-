import 'dart:convert';

import 'package:api_provider/models/category_model.dart';

import 'package:http/http.dart' as http;

class CategoryServices {
  static String baseUrl = "https://loksewa-quiz.herokuapp.com/";

  Future<List<Category>> fetchCategories() async {
    var url = Uri.parse(baseUrl + "quiz-category");
    var response = await http.get(url);

    List<Category> categories = [];
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var json = jsonDecode(jsonString);
      for (var item in json) {
        categories.add(Category.fromJson(item));
      }
      return categories;
    } else {
      return categories;
    }
  }

  Future<bool> addCategory(String categoryName) async {
    var url = Uri.parse(
      baseUrl + "quiz-category/",
    );
    var response = await http.post(url,
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': categoryName,
        }));

    // print(response.statusCode);
    if (response.statusCode == 201) {
      print("category added");
      return true;
    } else
      print("category not added");
    return false;
  }

  Future<bool> updateCategory(String categoryId, String categoryName) async {
    var url = Uri.parse(
      baseUrl + "quiz-category/$categoryId",
    );
    var response = await http.patch(url,
        headers: <String, String>{
          'content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{'name': categoryName}));
    if (response.statusCode == 200) {
      print("category updated");
      return true;
    } else
      print("category not updated");
    return false;
  }

  Future<bool> deleteCategory(String categoryId) async {
    var url = Uri.parse(baseUrl + "quiz-category/$categoryId");

    // var url = Uri.parse(baseUrl + "quiz-category/$categoryId");
    var response = await http.delete(url);

    print(response.statusCode);
    // headers: <String, String>{
    //   'content-Type': 'application/json; charset=UTF-8',
    // },
    // body: jsonEncode(<String, String>{'id': categoryId}));
    if (response.statusCode == 200) {
      print("category deleted");
      return true;
    } else
      print("category not deleted");
    return false;
  }
}

import 'package:flutter/foundation.dart';

class Category {
  String? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  CategoryCount? count;

  Category({this.id, this.name, this.createdAt, this.updatedAt, this.count});
  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = DateTime.parse(json['createdAt']);
    updatedAt = DateTime.parse(json['updatedAt']);
    count = CategoryCount.fromJson(json['_count']);
  }
}

class CategoryCount {
  int? questions;
  CategoryCount({this.questions});
  CategoryCount.fromJson(Map<String, dynamic> json) {
    questions = json['quizes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['questions'] = questions;
    return data;
  }
}

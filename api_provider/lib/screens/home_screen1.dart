import 'package:api_provider/models/category_model.dart';
import 'package:api_provider/providers/category_provider.dart';
import 'package:api_provider/screens/add_screen.dart';
import 'package:api_provider/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Admin"),
      ),
      body: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          print(categoryProvider.getCategories.length);

          if (categoryProvider.categories.isEmpty) {
            return Center(
              child: Text("123456"),
            );
          } else {
            return ListView.builder(
                itemCount: categoryProvider.getCategories.length-1,
                itemBuilder: ((context, index) {
                  List<Category> categories = categoryProvider.getCategories;
                  return CategoryCard(
                      number: categories[index + 1].toString(),
                      name: categories[index].name!,
                      id: categories[index].id!);
                  //  ListTile(title: Text(categories[index].name!));
                }));
          }
        },
      ),
      floatingActionButton: InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Screen2()));
          },
          child: Icon(Icons.add)),
    );
  }
}

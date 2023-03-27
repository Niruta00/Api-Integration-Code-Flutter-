import 'package:api_provider/models/category_model.dart';
import 'package:api_provider/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  TextEditingController categorycontroller = TextEditingController();
  String userTypeData = '';
  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryprovider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Category"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  userTypeData = value;
                });
              },
              controller: categorycontroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Category Name"),
            ),
            ElevatedButton(
                onPressed: () {
                  categoryprovider
                      .addCategory(categorycontroller.text);
                },
                child: Text("Add")),
            Text(userTypeData)
          ],
        ),
      ),
      // body: Container(
      //   color: Colors.deepPurple,
      // ),
    );
  }
}

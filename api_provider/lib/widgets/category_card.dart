import 'package:api_provider/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  final String number;
  final String name;
  final String id;

  const CategoryCard(
      {super.key, required this.number, required this.name, required this.id});

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blue,
              child: Center(
                child: Text(number.toString()),
              ),
            ),
          ),
          // decorated text
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 16, 19, 21),
                  ),
                ),
                Text(
                  id,
                  style: TextStyle(
                    color: Color.fromARGB(255, 16, 19, 21),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {
                  print(id);
                  categoryProvider.deleteCategory(id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ),
          Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: ((context) {
                        TextEditingController nameController =
                            TextEditingController();

                        nameController.text = name;

                        return AlertDialog(
                          title: Text("Edit Category"),
                          content: TextField(
                            controller: nameController,
                            onChanged: (value) {},
                          ),
                          actions: [
                            IconButton(
                                onPressed: () {
                                  categoryProvider.updateCategory(
                                      id, nameController.text);
                                },
                                icon: Icon(Icons.update))
                          ],
                        );
                      }));

                  // categoryProvider.editCategory(id);
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.purple,
                ),
              ))
        ],
      ),
    );
  }
}

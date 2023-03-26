import 'package:flutter/material.dart';
import '../helpers/api_service.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final jokesCategories = JokesCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<String>>(
        future: jokesCategories.getCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(data[index]),
                    ),
                separatorBuilder: (_, index) => const Divider(),
                itemCount: data!.length);
          } else {
            return const Text("Opps there is an error...");
          }
        },
      ),
    );
  }
}

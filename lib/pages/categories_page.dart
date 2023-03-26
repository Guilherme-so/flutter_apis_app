import 'package:flutter/material.dart';
import 'package:working_with_api/helpers/string_extention.dart';
import '../helpers/api_service.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  final jokesCategories = JokesCategories();
  late Future<List<String>> futureCategories;

  @override
  void initState() {
    futureCategories = jokesCategories.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/image.jpg'),
            radius: 50,
          ),
        ),
        title: const Text("Escolha a categoria"),
      ),
      body: FutureBuilder<List<String>>(
        future: futureCategories,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("requisition error."),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final data = snapshot.data;
            return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      title: Text(data![index].capitalize()),
                      leading: Text('${index + 1}'),
                      dense: true,
                    ),
                separatorBuilder: (_, index) => const Divider(),
                itemCount: data?.length ?? 0);
          } else {
            return const Center(
              child: Text("Opps there is an error..."),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
    );
  }
}

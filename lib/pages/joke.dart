import 'package:flutter/material.dart';
import 'package:working_with_api/helpers/api_service.dart';
import 'package:working_with_api/helpers/joke_type.dart';

class JokePage extends StatefulWidget {
  const JokePage({required this.joke, this.categoria, super.key});

  final String? categoria;
  final JokeType joke;
  @override
  State<JokePage> createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  final jokesCategories = JokesCategories();

  late JokeType joke = widget.joke;
  late JokeType newJoke;
  late String? category = widget.categoria;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categoria selecionada: $widget.categoria "),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 22),
            const Hero(
              tag: 'chuck',
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/image.jpg'),
                radius: 50,
              ),
            ),
            const SizedBox(height: 20),
            loading
                ? const CircularProgressIndicator()
                : Text(
                    joke.value!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          setState(() {
            loading = false;
          });
          try {
            setState(() {
              loading = true;
            });
            newJoke = await jokesCategories.getJokesByCategory(category!);

            setState(() {
              loading = false;
              joke = newJoke;
            });
          } catch (err) {
            setState(() {
              loading = false;
            });
          }
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}

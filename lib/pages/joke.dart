import 'package:flutter/material.dart';
import 'package:working_with_api/helpers/joke_type.dart';

class JokePage extends StatelessWidget {
  const JokePage({required this.joke, this.categoria, super.key});

  final String? categoria;
  final JokeType joke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categoria selecionada: $categoria "),
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
              Text(
                joke.value!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ));
  }
}

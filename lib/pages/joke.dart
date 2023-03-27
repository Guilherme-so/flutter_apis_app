import 'package:flutter/material.dart';

class JokePage extends StatelessWidget {
  const JokePage({this.categoria, super.key});

  final String? categoria;

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
            children: const [
              SizedBox(height: 22),
              Hero(
                tag: 'chuck',
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/image.jpg'),
                  radius: 50,
                ),
              )
            ],
          ),
        ));
  }
}

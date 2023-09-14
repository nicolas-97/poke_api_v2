import 'package:flutter/material.dart';
import 'package:mvvm_basic/views/screens/home/home_view_model.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: homeVM.pokemonList.map((e) => ListTile(
          leading: Image.network(
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${e.id}.png',
            ),
          title: Text(e.name),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_right),
            onPressed: () {
              print('object');
            },
          ),
        )).toList()
      )
    );
  }
}

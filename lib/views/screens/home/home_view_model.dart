import 'package:flutter/cupertino.dart';
import 'package:mvvm_basic/data/models/service/pokedex_response.dart';
import 'package:mvvm_basic/utils/api/api_client.dart';
import 'dart:convert';

class HomeViewModel extends ChangeNotifier{

  List<PokedexList> pokemonList = [];

  HomeViewModel(){
    getAllPokemons();
  }
  
  getAllPokemons() async {
    
    final response = await ApiClient.instance().get('/api/v2/pokemon/');

    PokedexResponse data = PokedexResponse.fromJson(json.decode(response.body));

    pokemonList = [...pokemonList, ...data.results];

    notifyListeners();
  }

}
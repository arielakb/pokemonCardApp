import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final http.Client httpClient;

  PokemonCubit({required this.httpClient}) : super(PokemonInitial());

  void fetchPokemon() async {
    try {
      emit(PokemonLoading());
      final response =
          await httpClient.get(Uri.parse('https://api.pokemontcg.io/v2/cards'));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final pokemonDataList = (jsonResponse['data'] as List<dynamic>)
            .map((data) => Data.fromJson(data))
            .toList();

        emit(PokemonLoaded(pokemonList: pokemonDataList));
      } else {
        emit(PokemonError(errorMessage: 'Failed to load pokemon cards'));
      }
    } catch (e) {
      emit(PokemonError(errorMessage: e.toString()));
    }
  }
}

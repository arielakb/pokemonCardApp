part of 'pokemon_cubit.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {
  final List<Data> pokemonList;

  PokemonLoaded({required this.pokemonList});

  @override
  List<Object?> get props => [pokemonList];
}

class PokemonError extends PokemonState {
  final String errorMessage;

  PokemonError({required this.errorMessage});
}

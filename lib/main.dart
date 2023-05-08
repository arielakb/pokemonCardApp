import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'cubit/pokemon_cubit.dart';

import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon Cards',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonCardsPage(),
    );
  }
}

class PokemonCardsPage extends StatefulWidget {
  @override
  _PokemonCardsPageState createState() => _PokemonCardsPageState();
}

class _PokemonCardsPageState extends State<PokemonCardsPage> {
  final _pokemonCubit = PokemonCubit(httpClient: http.Client());

  @override
  void initState() {
    super.initState();
    _pokemonCubit.fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Cards'),
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        bloc: _pokemonCubit,
        builder: (context, state) {
          if (state is PokemonInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonLoaded) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: state.pokemonList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: [
                      Image.network(state.pokemonList[index].images.large),
                      SizedBox(height: 16.0),
                      Text(state.pokemonList[index].name),
                      SizedBox(height: 8.0),
                      Text(state.pokemonList[index].supertype),
                      SizedBox(height: 8.0),
                      Text('HP: ${state.pokemonList[index].hp}'),
                    ],
                  ),
                );
              },
            );
          } else if (state is PokemonError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
    );
  }

  @override
  void dispose() {
    _pokemonCubit.close();
    super.dispose();
  }
}

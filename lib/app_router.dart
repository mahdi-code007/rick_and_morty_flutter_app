import 'package:rick_and_morty_app/business_logic/characters_cubit.dart';
import 'package:rick_and_morty_app/constants/strings.dart';
import 'package:rick_and_morty_app/data/repository/character_repository.dart';
import 'package:rick_and_morty_app/data/web_services/character_web_services.dart';
import 'package:rick_and_morty_app/presentation/screens/character_details.dart';
import 'package:rick_and_morty_app/presentation/screens/character_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(characterRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => charactersCubit,
                child: const CharacterScreen())
        );
      case charactersDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetailsScreen());
    }
  }
}

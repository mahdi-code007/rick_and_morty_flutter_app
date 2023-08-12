import 'package:rick_and_morty_app/business_logic/characters_cubit.dart';
import 'package:rick_and_morty_app/constants/my_colors.dart';
import 'package:rick_and_morty_app/data/models/characters_model.dart';
import 'package:rick_and_morty_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Results> allCharacter;
  late List<Results> searchedForCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();



  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacter = (state).character;
          return buildLoadedListWidget();
        } else {
          return showLoadedIndicator();
        }
      },
    );
  }

  Widget buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          children: [buildCharactersList()],
        ),
      ),
    );
  }

  Widget buildCharactersList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.66666,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      itemBuilder: (context, index) {
        return CharactersItem(
          characters: allCharacter[index],
        );
      },
      itemCount: allCharacter.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Characters',
          style: TextStyle(color: Colors.white),
        ),
        actions:  const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search),
          )
        ],
        backgroundColor: MyColors.myFavColor,
      ),
      body: buildBlocWidget(),
    );
  }

  Widget showLoadedIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myFavColor,
      ),
    );
  }
}

import 'package:rick_and_morty_app/constants/my_colors.dart';
import 'package:rick_and_morty_app/data/models/characters_model.dart';
import 'package:flutter/material.dart';

class CharactersItem extends StatelessWidget {
  final Results characters;

  const CharactersItem({Key? key, required this.characters}) : super(key: key);

  Widget showLoadedIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myFavColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
          color: MyColors.myWhite, borderRadius: BorderRadius.circular(8)),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            characters.name,
            style: const TextStyle(
                height: .9,
                fontSize: 12,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
            color: MyColors.myGrey,
            child: characters.image.isNotEmpty
                ? FadeInImage.assetNetwork(
              width: double.infinity,
              height: double.infinity,
              placeholder: 'assets/images/loading.gif',
              image: characters.image,
              fit: BoxFit.cover,
            )
                : Image.asset('assets/images/error.gif')),
      ),
    );
  }
}



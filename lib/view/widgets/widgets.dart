import 'package:breakingbad_with_bloc/busieness_logic/cubit/characters_cubit.dart';
import 'package:breakingbad_with_bloc/constants/app_style.dart';
import 'package:breakingbad_with_bloc/constants/size_config.dart';
import 'package:breakingbad_with_bloc/data/api/characters_api.dart';
import 'package:breakingbad_with_bloc/data/repostiory/characters_repostiory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:breakingbad_with_bloc/data/models/character_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



  Widget createCharacterItem(CharacterModel characterModel, BuildContext context) {
    double? sizeW = SizeConfig.screenWidth;
    double? sizeH = SizeConfig.screenHeight;
    return Container(
      padding: const EdgeInsetsDirectional.all(2.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
        color: Colors.white24,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, 'CharacterDetailsScreen',
              arguments: characterModel);
        },
        child: GridTile(
          child: Hero(
            tag: characterModel.charID,
            child: Container(
              color: Colors.yellow,
              child: characterModel.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                width: sizeW,
                height: sizeH,
                fit: BoxFit.cover,
                placeholder: 'assets/images/loading.gif',
                image: characterModel.image,
              )
                  : Image.asset('assets/images/genericErrorState.png'),
            ),
          ),

          /// Text on pic
          footer: Container(
            width: double.infinity,
            color: Colors.black54,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            alignment: Alignment.bottomCenter,
            child: Text(
              characterModel.name,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: myWhite,
                height: 1.2,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget buildDivider(double endIndent) {
    return Divider(
      endIndent: endIndent,
      height: 25,
      thickness: 2,
      color: myYellow,
    );
  }
  Widget characterInfo({String? value, String? title}) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
              text: title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
          TextSpan(
              text: value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              )),
        ],
      ),
    );
  }








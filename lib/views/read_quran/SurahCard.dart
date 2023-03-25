import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/views/shared/ImageCard.dart';

import '../../models/Surah.dart';
import 'SurahScreen.dart';

Widget SurahCard(
    Surah surah,
    BuildContext context
    ){
  TextStyle style =TextStyle(fontWeight: FontWeight.bold,fontSize: 20);
  return InkWell(
    onTap: (){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => SurahScreen(index: surah.index,),
        ),
      );
    },
    child: ImageCard(
      imageWidth: 85,
      imageHeight: 145,
      imageMask: surah.isMakia ? "assets/images/maki.png" : "assets/images/madani.png",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(surah.name,style: style,),
          Text("الآية ${surah.ayahts.length}",style: style,),
        ],
      ),
    ),
  );
}
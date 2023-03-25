import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/QuranProvider.dart';
import 'package:quran_app/views/colors.dart';
import 'package:quran_app/views/read_quran/SurahCard.dart';
import 'package:quran_app/views/search/AyahCard.dart';
import 'package:quran_app/views/shared/DefultScreen.dart';
import 'package:quran_app/views/shared/FlotingBottomNavBar.dart';
import 'package:quran_app/views/shared/FeatureImageCard.dart';
import 'package:quran_app/views/shared/QuranAppBar.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../models/Feature.dart';
import '../../models/Surah.dart';
import '../font.dart';
import '../main.dart';
import '../shared/ImageCard.dart';
import '../shared/StyleSupport.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    QuranProvider provider=context.watch<QuranProvider>();
    return Scaffold(
      backgroundColor: brown,
      appBar: SearchAppBar(),
       body: Container(
         width: fillMaxSize(),
         height: fillMaxSize(),
         color: brown,
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 10),
           child: ListView
               .separated(
             padding: const EdgeInsets.all(0),
             itemCount: provider.searchAyahs?.length ?? 0,
             itemBuilder: (BuildContext context, int index) {
               return AyahCard(provider.searchAyahs![index]);
             },
             separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
           ),
         ),
        )
    );
  }
}




class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  var navController = TextEditingController();

  @override
  Size get preferredSize => Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    QuranProvider provider = context.read<QuranProvider>();
    return  Container(
      width: fillMaxSize(),
      height: 110,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)
          )
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[ Padding(
            padding: const EdgeInsets.only(bottom:14.0,left: 25,right: 25),
            child:
              TextField(
                controller: navController,
                textInputAction: TextInputAction.search,
                onEditingComplete: (){
                  provider.search(navController.text);
                },
                decoration: new InputDecoration(
                  suffixIcon: Icon(
                    Icons.search_outlined,
                    color: brown,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 14,horizontal: 25),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: brown, width: 3.0),
                      borderRadius: BorderRadius.circular(130)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: brown, width: 3.0),
                      borderRadius: BorderRadius.circular(130)
                  ),
                  hintText: 'إبحث عن الاية اللتي تريد',
                ),
              ),
          ),
          ]),
    );
  }
}




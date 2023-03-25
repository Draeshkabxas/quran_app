import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/QuranProvider.dart';
import 'package:quran_app/views/colors.dart';
import 'package:quran_app/views/read_quran/SurahCard.dart';
import 'package:quran_app/views/shared/DefultScreen.dart';
import 'package:quran_app/views/shared/FlotingBottomNavBar.dart';
import 'package:quran_app/views/shared/FeatureImageCard.dart';
import 'package:quran_app/views/shared/QuranAppBar.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../models/Feature.dart';
import '../../models/Surah.dart';
import '../main.dart';
import '../shared/ImageCard.dart';
import '../shared/StyleSupport.dart';

class SurahListScreen extends StatefulWidget {
  const SurahListScreen({Key? key}) : super(key: key);

  @override
  State<SurahListScreen> createState() => _SurahListScreenState();
}

class _SurahListScreenState extends State<SurahListScreen> {
  @override
  Widget build(BuildContext context) {
    QuranProvider provider=context.watch<QuranProvider>();
    return QuranDefaultScreen(
      hasBack: true,
      hasBottomNav: false,
        title: "الفهرس",
        content: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView
              .separated(
            padding: const EdgeInsets.all(0),
            itemCount: provider.surahs?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return SurahCard(provider.surahs![index],context);
            },
            separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
          ),
        ));
  }
}

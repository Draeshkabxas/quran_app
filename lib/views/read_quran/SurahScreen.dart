import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/models/QuaranData.dart';
import 'package:quran_app/providers/QuranProvider.dart';
import 'package:quran_app/views/colors.dart';
import 'package:quran_app/views/font.dart';
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

class SurahScreen extends StatefulWidget {
  int index = 0;

  SurahScreen({Key? key, required int index}) : super(key: key) {
    this.index = index;
  }

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  late Surah surah;

  @override
  Widget build(BuildContext context) {
    QuranProvider provider = context.watch<QuranProvider>();
    surah = provider.surahs![widget.index - 1];
    print(surah.getSurah());
    return QuranDefaultScreen(
        title: surah.name,
        hasBack: true,
        hasBottomNav: false,
        content: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                width: fillMaxSize(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        Text(
                          "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: '${RIWAYA.name}',
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          surah.getSurah(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: '${RIWAYA.name}',
                            fontWeight: FontWeight.w600,
                            fontSize: FONT_SIZE,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_app/views/colors.dart';
import 'package:quran_app/views/read_quran/SurahsListScreen.dart';
import 'package:quran_app/views/search/SearchScreen.dart';
import 'package:quran_app/views/shared/DefultScreen.dart';
import 'package:quran_app/views/shared/FlotingBottomNavBar.dart';
import 'package:quran_app/views/shared/FeatureImageCard.dart';
import 'package:quran_app/views/shared/QuranAppBar.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../models/Feature.dart';
import '../main.dart';
import '../shared/StyleSupport.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return QuranDefaultScreen(
        content: Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            FeatureImageCard(
                Feature(
              "قراءة",
              "قراءة القرءان رحلة ملئة بالكنز " + "\nفلا تدع الحسنات تنتضر",
              "إبد الرحلة",
              "assets/images/read_card.png",
              SurahListScreen(),
            ),
              context
            ),
            FeatureImageCard(
                Feature(
                  "تصفح",
                  "انتقل فورا الى الآية التي\n"+
                  "تريد",
                  "تصفح",
                  "assets/images/search.png",
                  SearchScreen(),
                ),
                context
            ),
            FeatureImageCard(
                Feature(
                  "إستماع",
                  "استمع الى قارئك المفضل" + "\n من اي مكان",
                  "إبد الرحلة",
                  "assets/images/audio.png",
                  Container(),
                ),
                context
            ),
            FeatureImageCard(
                Feature(
                  "إختبار الحفظ",
                  "شدة الحفظ تأتي من" + "\nالمراجعة و الاختبار",
                  "إبد الرحلة",
                  "assets/images/test.png",
                  Container(),
                ),
                context
            ),
            FeatureImageCard(
                Feature(
                  "ورد",
                  "قراءة القرءان رحلة ملئة بالكنز" + "\n فلا تدع الحسنات تنتضر",
                  "إبد الرحلة",
                  "assets/images/warada.png",
                  Container(),
                ),
                context
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 110.0),
              child: FeatureImageCard(
                  Feature(
                    "أذكار",
                    "قراءة القرءان رحلة ملئة بالكنز " + "\nفلا تدع الحسنات تنتضر",
                    "إبد الرحلة",
                    "assets/images/rmembrance.png",
                    Container(),
                  ),
                  context
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

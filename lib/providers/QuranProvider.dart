import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran_app/models/Surah.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Ayah.dart';


class QuranProvider extends ChangeNotifier{
  List<Ayah>? ayahs;
  List<Ayah>? searchAyahs;
  List<Surah>? surahs;
  List<int> madania=[2,3,4,5,8,9,13,22,24,33,47,48,49,55,57,58,59,60,61,62,63,64,65,66,76,98,99,110];
  QuranProvider(){
    getData();
  }

  Future<void> getData() async {
    if(ayahs !=null && surahs != null) return;
    await readJson();
    await getSurahs();
    notifyListeners();
    test();
  }


  Future<void> readJson() async {
    final String response = await rootBundle.loadString('quran_data/QalounData.json');
    final data = await json.decode(response) as List;
    ayahs = data.map((ayah) => Ayah.fromJson(ayah)).toList();
  }

  bool isMaki(int index){
    return !madania.contains(index);
  }

  Future<void> search(String search) async {
    String regJustArabic = r'[\0600–\06FF]';
    RegExp regExp = new RegExp(regJustArabic);
    if(ayahs == null) await getData();
    searchAyahs = [];
    ayahs?.forEach((ayah) {
      var match= regExp.allMatches(ayah.ayaText!);
      print("match ${match.first[0]}");
      if(match.contains(search)){
        searchAyahs?.add(ayah);
      }
    });
    notifyListeners();
  }


  Future<void> getSurahs() async {
    surahs =<Surah>[];
    Map<String,Surah> map=new HashMap();
    ayahs?.forEach((ayah) {
      if(map.containsKey(ayah.suraNameAr)){
        map[ayah!.suraNameAr]?.ayahts.add(ayah);
      }else{
        Surah surah = Surah(name: ayah!.suraNameAr ?? "", index:  ayah!.suraNo?.toInt() ?? 0,isMakia: isMaki(ayah!.suraNo!.toInt()), ayahts: []);
        surah.ayahts.add(ayah);
        map[ayah!.suraNameAr ?? ""] = surah;
      }
    });
    surahs = map.values.toList();
    surahs?.sort((a,b) => a.index.compareTo(b.index));
  }

  Future<void> test() async {
    int i= 0;
    while(i < 10){
      print("${surahs?[i]}");
      i++;
    }
  }
}

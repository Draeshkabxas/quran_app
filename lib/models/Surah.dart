
import 'Ayah.dart';

class Surah {
  late String name;
  late int index;
  late List<Ayah> ayahts;
  late bool isMakia;
  Surah({required String name,required int index,required List<Ayah> ayahts,required bool isMakia}){
    this.name = name;
    this.index = index;
    this.ayahts = ayahts;
    this.isMakia = isMakia;
}

@override
  String toString() {
    return "$name : $index : $isMakia : ${ayahts.length}";
  }

  String getSurah(){
    StringBuffer surah = StringBuffer("");
    ayahts.map((ayah) => ayah.ayaText!).forEach((ayah) {surah.write(ayah);});
    return surah.toString();
  }
}
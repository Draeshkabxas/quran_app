

import 'package:flutter/cupertino.dart';
import 'package:quran_app/views/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier{
  static const FONT_SIZE_KEY = "FONT_SIZE";
  static const SOUND_LEVEL_KEY = "SOUND_LEVEL";
  static const RIWAYAT_KEY = "RIWAYAT";
  SharedPreferences? pref;

  init(){
    getSharePref();
  }

  Future<void> getSharePref() async {
    pref = await SharedPreferences.getInstance();
  }

  Future<void> setFontSize(double fontSize) async {
    await pref?.setDouble(FONT_SIZE_KEY, fontSize);
    notifyListeners();
    print("Font size is set to $fontSize");
  }

  Future<double> getFontSize() async {
    return pref?.getDouble(FONT_SIZE_KEY) ?? 20;
  }

  Future<void> setSoundLevel(double soundLevel) async {
    await pref?.setDouble(SOUND_LEVEL_KEY, soundLevel);
    notifyListeners();
    print("Sound level is set to $soundLevel");
  }

  Future<double> getSoundLevel() async {
    return pref?.getDouble(SOUND_LEVEL_KEY) ?? 20;
  }


  Future<void> setRiwayat(Riwayat riwayat) async {
    await pref?.setString(RIWAYAT_KEY, riwayat.toString());
    notifyListeners();
    print("Riwayat is set to $riwayat");
  }

  Future<String> getRiwayat() async {
    return pref?.getString(RIWAYAT_KEY) ?? Riwayat.Qalon.toString();
  }
}
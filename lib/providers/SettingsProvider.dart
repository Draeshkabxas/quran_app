

import 'package:flutter/cupertino.dart';
import 'package:quran_app/models/QuaranData.dart';
import 'package:quran_app/views/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:volume_controller/volume_controller.dart';

import '../views/font.dart';

class SettingsProvider extends ChangeNotifier{
  static const FONT_SIZE_KEY = "FONT_SIZE";
  static const SOUND_LEVEL_KEY = "SOUND_LEVEL";
  static const RIWAYAT_KEY = "RIWAYAT";
  SharedPreferences? pref;

  init(){
    getSharePref();
  }

  Future<void> getSharePref() async {
    if(pref != null)
    pref = await SharedPreferences.getInstance();
  }

  Future<void> setFontSize(double fontSize) async {
    getSharePref();
    await pref?.setDouble(FONT_SIZE_KEY, fontSize);
    FONT_SIZE = fontSize;
    notifyListeners();
  }

  Future<double> getFontSize() async {
    getSharePref();
    return pref?.getDouble(FONT_SIZE_KEY) ?? 20;
  }

  Future<void> setSoundLevel(double soundLevel) async {
    VolumeController().setVolume(soundLevel,showSystemUI: true);
  }

  Future<double> getSoundLevel() async {
    return VolumeController().getVolume();
  }


  Future<void> setRiwayat(Riwayat riwayat) async {
    getSharePref();
    await pref?.setString(RIWAYAT_KEY, riwayat.toString());
    RIWAYA = riwayat;
    notifyListeners();
    print("Riwayat is set to ${riwayat.name}");
  }

  Future<String> getRiwayat() async {
    getSharePref();
    return pref?.getString(RIWAYAT_KEY) ?? Riwayat.Qaloun.toString();
  }
}
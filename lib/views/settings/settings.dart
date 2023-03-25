import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/QuranProvider.dart';
import 'package:quran_app/providers/SettingsProvider.dart';

import '../colors.dart';
import '../shared/DefultScreen.dart';
import '../shared/StyleSupport.dart';


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int fontSize= 50;
  int soundLevel= 20;

  _SettingsState({Key? key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider watcher=context.watch<SettingsProvider>();
    SettingsProvider provider=context.read<SettingsProvider>();
    QuranProvider quran=context.read<QuranProvider>();
    quran.getData();
    provider.getFontSize().then((value) {
      fontSize=value.toInt();
    });
    provider.getSoundLevel().then((value) {
      soundLevel=value.toInt();
    });
    return QuranDefaultScreen(
      selectedBottomNav: 2,
      content: Padding(
        padding: const EdgeInsets.only(bottom: 120, left: 20, right: 20),
        child: Container(
          width: fillMaxSize(),
          height: fillMaxSize(),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Container(
                width: 50,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SliderSetting(
                          valueHolder: fontSize,
                          title: "حجم الخط",
                          minLabel: "صغير",
                          maxLabel: "كبير",
                          onChange: (value) {
                            provider.setFontSize(value.toDouble()  );
                            setState(() {});
                          }),
                      SizedBox(
                        height: 20,
                      ),
                      SliderSetting(
                          valueHolder: soundLevel,
                          title: "مستوى الصوت",
                          minLabel: "منخفض",
                          maxLabel: "مرتفع",
                          onChange: (value) {
                            provider.setSoundLevel(value.toDouble());
                            setState(() {});
                          }),
                      Riwayats(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle settingsHeadersStyle(){
  return TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
}

enum Riwayat {
  Hafs,
  Warsh,
  Qalon,
  AlDouri,
  AlHarith,
  AlKisai,
  Shubas,
  Qunbul,
  Albizii,
  Alsuwsi
}

class Riwayats extends StatefulWidget {
  const Riwayats({super.key});

  @override
  State<Riwayats> createState() => _RiwayatsState();
}

class _RiwayatsState extends State<Riwayats> {
  late SettingsProvider provider;
  late Riwayat _riwayat = Riwayat.Qalon;
  Key key=Key(Riwayat.Qalon.toString());
  void onRiwayatRadioButtonClicked(Riwayat value){
    setState(() {
      provider.setRiwayat(value);
      _riwayat = value;
    });
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,() {
      provider= context.read<SettingsProvider>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("القراءات العشر",style: settingsHeadersStyle(),),
          RiwayatRadioButton(
              key: key,
              riwayat: Riwayat.Qalon,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية حفص عن عاصم",
              riwayat: Riwayat.Hafs,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية ورش عن نافع",
              riwayat: Riwayat.Warsh,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية الدوري عن أبي عمرو",
              riwayat: Riwayat.AlDouri,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية أبي الحارث عن الكسائي",
              riwayat: Riwayat.AlHarith,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية الدوري عن الكسائي",
              riwayat: Riwayat.AlKisai,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية شعبة عن عاصم",
              riwayat: Riwayat.Shubas,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية قنبل عن ابن كثير",
              riwayat: Riwayat.Qunbul,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية البزي عن ابن كثير",
              riwayat: Riwayat.Albizii,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              }),
          RiwayatRadioButton(
              title: "رواية السوسي عن أبي عمرو",
              riwayat: Riwayat.Alsuwsi,
              selected: _riwayat,
              onChange: (value) {
                onRiwayatRadioButtonClicked(value);
              })
        ],
      ),
    );
  }
}

class RiwayatRadioButton extends StatefulWidget {
  late String title;
  late Riwayat riwayat;
  late Riwayat selected;
  late  Function(Riwayat value) onChange;


  RiwayatRadioButton({Key? key,String title = " رواية قالون عن نافع",
  required Riwayat riwayat,
  required Riwayat selected,
  required Function(Riwayat value) onChange}) : super(key: key){
    this.title = title;
    this.riwayat = riwayat;
    this.selected = selected;
    this.onChange = onChange;
  }

  @override
  State<RiwayatRadioButton> createState() => _RiwayatRadioButtonState();
}

class _RiwayatRadioButtonState extends State<RiwayatRadioButton> {

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      title: Text(widget.title,),
      tileColor: brown,
      leading: Radio<Riwayat>(
        value: widget.riwayat,
        activeColor: darkBrwon,
        groupValue: widget.selected,
        onChanged: (Riwayat? value) {
          setState(() {
            widget.onChange(value!);
          });
        },
      ),
    );
  }
}



class SliderSetting extends StatefulWidget {
  late int valueHolder;
  late double min;
  late double max;
  late String title;
  late String minLabel;
  late String maxLabel;
  late Function(int value) onChange;
  late int? division;

  SliderSetting({Key? key ,required int valueHolder,
  double min = 1,
  double max = 100,
  required String title,
  required String minLabel,
  required String maxLabel,
  required Function(int value) onChange,
  int? division
  }) : super(key: key){
    this.valueHolder =valueHolder;
    this.min=min;
    this.max=max;
    this.title=title;
    this.minLabel=minLabel;
    this.maxLabel=maxLabel;
    this.onChange=onChange;
    this.division=division;
  }

  @override
  State<SliderSetting> createState() => _SliderSettingState();
}

class _SliderSettingState extends State<SliderSetting> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title,style: settingsHeadersStyle(),),
        SizedBox(
          height: 5,
        ),
        Slider(
            value: widget.valueHolder.toDouble(),
            min: widget.min,
            max: widget.max,
            divisions: widget.division,
            activeColor: darkBrwon,
            inactiveColor: brown,
            secondaryActiveColor: brown,
            label: '${widget.valueHolder.round()}',
            onChanged: (double newValue) {
              widget.valueHolder = newValue.round();
              print("$widget.valueHolder v");
              widget.onChange(newValue.round());
              setState(() {

              });
            },
            semanticFormatterCallback: (double newValue) {
              return '${newValue.round()}';
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.minLabel),
            Text(widget.maxLabel),
          ],
        )
      ],
    );
  }
}



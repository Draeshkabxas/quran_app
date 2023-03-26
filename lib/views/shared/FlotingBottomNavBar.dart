import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/views/colors.dart';
import 'package:quran_app/views/home/home_screen.dart';
import 'package:quran_app/views/settings/settings.dart';

import 'StyleSupport.dart';

double _iconSize = 33;
double _iconSelectedSize = 38;

class FlotingBottomNavigationBar extends StatefulWidget {
  int _selected=1;
  FlotingBottomNavigationBar({Key? key,int selected = 1}) : super(key: key){
   _selected= selected;
  }

  @override
  State<FlotingBottomNavigationBar> createState() =>
      _FlotingBottomNavigationBarState(_selected);
}

class _FlotingBottomNavigationBarState
    extends State<FlotingBottomNavigationBar> {
  int selected = 1;

  _FlotingBottomNavigationBarState(this.selected);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          width: fillMaxSize(),
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:20.0,left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                  child: FlotingIcon(
                      iconPath: "assets/svg/man.svg",
                      index: 0,
                      selectedIndex: selected,
                      onTap: (index) {
                        selected = index;
                        setState(() {});
                      })),
              Expanded(
                  child: FlotingIcon(
                      iconPath: "assets/svg/home.svg",
                      index: 1,
                      selectedIndex: selected,
                      onTap: (index) {
                        navToScreen(const HomeScreen(), context);
                        selected = index;
                        setState(() {});
                      })),
              Expanded(
                child: FlotingIcon(
                    iconPath: "assets/svg/settings.svg",
                    index: 2,
                    selectedIndex: selected,
                    onTap: (index) {
                      navToScreen(const Settings(), context);
                      selected = index;
                      setState(() {});
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
void navToScreen(Widget screen,BuildContext context){
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    ),
  );
}

Widget FlotingIcon(
    {required String iconPath,
      Color selectedColor = darkBrwon,
      required int index,
    required int selectedIndex,
    Function(int index)? onTap}) {
  return index != selectedIndex
      ? InkWell(
          child: SvgPicture.asset(
            iconPath,
            semanticsLabel: 'Acme Logo',
            colorFilter: ColorFilter.mode(brown, BlendMode.srcIn),
            width: _iconSize,
            height: _iconSize,
          ),
          onTap: () {
            onTap!(index);
          },
        )
      : InkWell(
          onTap: () {
            onTap!(index);
          },
          child: FlotingSelectedIcon(
              iconPath: iconPath,
              selectedColor: selectedColor,
              index: index,
              onTap: onTap),
        );
}

Widget FlotingSelectedIcon(
    {required String iconPath,
    Color selectedColor = darkBrwon,
    required int index,
    Function(int index)? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Stack(alignment: AlignmentDirectional.center, children: [
      SvgPicture.asset(
        "assets/svg/floting_icon.svg",
        semanticsLabel: 'Acme Logo',
        width: 95,
        height: 95,
      ),
      SvgPicture.asset(
        "assets/svg/floting_icon.svg",
        semanticsLabel: 'Acme Logo',
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        width: 73,
        height: 73,
      ),
      SvgPicture.asset(
        iconPath,
        semanticsLabel: 'Acme Logo',
        colorFilter: ColorFilter.mode(darkBrwon, BlendMode.srcIn),
        width: _iconSelectedSize,
        height: _iconSelectedSize,
      ),
    ]),
  );
}

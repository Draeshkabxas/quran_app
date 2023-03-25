

import 'package:flutter/material.dart';
import 'package:quran_app/views/colors.dart';
import 'FlotingBottomNavBar.dart';
import 'QuranAppBar.dart';
import 'StyleSupport.dart';

class QuranDefaultScreen extends StatefulWidget {
  late Widget _content;
  late bool _hasBack;
  late bool _hasBottomNav;
  late int _selectedBottomNav;
  late String title;

  QuranDefaultScreen(
  {
    required Widget content,
    bool hasBack = false,
    bool hasBottomNav=true,
    int selectedBottomNav = 1,
    String title = "إقرأ",
  }
      ){
    _content=content;
    _hasBack=hasBack;
    _hasBottomNav=hasBottomNav;
    _selectedBottomNav = selectedBottomNav;
    this.title = title;

  }

  @override
  State<QuranDefaultScreen> createState() => _QuranDefaultScreenState(
    _content,
    _hasBack,
    _hasBottomNav,
    _selectedBottomNav
  );
}

class _QuranDefaultScreenState extends State<QuranDefaultScreen> {
  late Widget content;
  late bool hasBack;
  late bool hasBottomNav;
  int selectedBottomNav = 1;

  _QuranDefaultScreenState(this.content,this.hasBack,this.hasBottomNav,this.selectedBottomNav){
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuranAppBar(title:widget.title, hasBack: hasBack),
      body: Container(
        width: fillMaxSize(),
        height: fillMaxSize(),
        color: brown,
        child: content,
      ),
      floatingActionButton: hasBottomNav ? FlotingBottomNavigationBar(selected: selectedBottomNav,) : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/views/colors.dart';
import 'package:quran_app/views/font.dart';

import 'StyleSupport.dart';

class QuranAppBar extends StatelessWidget implements PreferredSizeWidget {
  late String _title;
  late Widget? _backIcon;
  late bool _hasBack;
  QuranAppBar(
      {required String title,Widget? backIcon,bool hasBack = true}
      ){
    _title=title;
    _backIcon=backIcon;
    _hasBack=hasBack;
  }

  @override
  Size get preferredSize => Size.fromHeight(90);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: fillMaxSize(),
      color: brown,
      child: Column(
        children: [
          Container(
            width: fillMaxSize(),
            height: 110,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                )
            ),
            child: Stack(
                children: [ _hasBack ? Container(
                    height:fillMaxSize(),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: IconButton(onPressed: (){
                            Navigator.pop(context);
                          }, icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: darkBrwon,
                            size: 30,
                          )),
                        ),
                      ],
                    )
                ):  Container(),
                  Container(
                    width: fillMaxSize(),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:[ Padding(
                          padding: const EdgeInsets.only(bottom:9.0),
                          child: Text(
                            _title,
                            style: TextStyle(
                                fontSize: TITLE_FONT_SIZE,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        ]
                    ),
                  ),
                ]
            ),
          )
        ],
      ),
    );
  }
}


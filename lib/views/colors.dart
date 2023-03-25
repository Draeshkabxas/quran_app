
import 'dart:ui';

import 'package:flutter/material.dart';

extension MaterialColorParser on Color{
  MaterialColor material(){
    Map<int, Color> color =
    {
      50:Color.fromRGBO(this.red,this.green,this.blue, .1),
      100:Color.fromRGBO(this.red,this.green,this.blue, .2),
      200:Color.fromRGBO(this.red,this.green,this.blue, .3),
      300:Color.fromRGBO(this.red,this.green,this.blue, .4),
      400:Color.fromRGBO(this.red,this.green,this.blue, .5),
      500:Color.fromRGBO(this.red,this.green,this.blue, .6),
      600:Color.fromRGBO(this.red,this.green,this.blue, .7),
      700:Color.fromRGBO(this.red,this.green,this.blue, .8),
      800:Color.fromRGBO(this.red,this.green,this.blue, .9),
      900:Color.fromRGBO(this.red,this.green,this.blue, 1),
    };
    return MaterialColor(this.value, color);
  }
}

const Color brown=Color(0xffBF9B79);
const Color white=Color(0xffffffff);
const Color darkBrwon=Color(0xff593E2D);

MaterialColor darkBrownX=darkBrwon.material();


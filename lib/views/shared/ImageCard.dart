import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../models/Feature.dart';
import '../colors.dart';
import 'StyleSupport.dart';

Widget ImageCard(
    {required Widget content,
    required double imageWidth,
    required double imageHeight,
    required String imageMask}) {
  return Stack(
    alignment: AlignmentDirectional.centerEnd,
    children: [
      Container(
        width: fillMaxSize(),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(20),
            color: Colors.white),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 22, left: 22, right: 22, bottom: 22),
          child: content,
        ),
      ),
      WidgetMask(
        blendMode: BlendMode.srcATop,
        childSaveLayer: true,
        mask: Image.asset(
          imageMask,
          width: imageWidth,
          height: imageHeight,
          fit: BoxFit.cover,
        ),
        child: Image.asset(
          "assets/images/card_mask.png",
          width: imageWidth,
          fit: BoxFit.cover,
          height: imageHeight,
        ),
      ),
    ],
  );
}

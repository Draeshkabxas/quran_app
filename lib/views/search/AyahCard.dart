import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/models/Ayah.dart';

import '../colors.dart';
import '../shared/StyleSupport.dart';

Widget AyahCard(
    Ayah ayah
    ) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: fillMaxSize(),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الآية ${ayah.ayaNo}",
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 170,
                          child: Text(
                            ayah.ayaText!,
                            style: TextStyle(
                              fontFamily: 'Qaloun',
                              fontWeight: FontWeight.bold,

                            ),
                          )),
                    ],
                  ),
                ),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/islamic.svg",
                      width: 110,
                    ),
                    Text(
                      ayah.suraNameAr!,
                      style: TextStyle(
                          fontSize: 23, fontWeight: FontWeight.w700),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}

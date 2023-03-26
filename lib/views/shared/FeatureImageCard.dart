import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quran_app/models/Feature.dart';
import 'package:widget_mask/widget_mask.dart';
import '../colors.dart';
import 'StyleSupport.dart';

Widget FeatureImageCard({
 required Feature feature,
 required BuildContext context,
 bool isReady=false,
}){
  return
    Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Container(
          width: fillMaxSize(),
          decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(20),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.only(top: 22,left: 22, right: 22,bottom: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  feature.name,
                  style: TextStyle(fontSize: 33),
                ),
                SizedBox(height: 5,),
                Text(
                  feature.description,
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.all(
                      Radius.circular(20),
                    ),
                    color: brown,
                  ),
                  child: isReady ? InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(feature.goButtonText,style: TextStyle(color: Colors.white),),
                        Icon(Icons.arrow_forward_rounded,color: Colors.white,)
                      ],
                    ),
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => feature.path,
                        ),
                      );
                    },
                  ) : Center(
                    child: Text("قريبا",style: TextStyle(color: Colors.white),),
                  ),
                )
              ],
            ),
          ),
        ),
        WidgetMask(
          blendMode: BlendMode.srcATop,
          childSaveLayer: true,
          mask: Image.asset(
            feature.image,
            width: 140,
            height: 215,
            fit: BoxFit.cover,
          ),
          child: Image.asset(
            "assets/images/card_mask.png",
            width: 140,
            fit: BoxFit.cover,
            height: 215,
          ),
        ),
      ],
    );
}
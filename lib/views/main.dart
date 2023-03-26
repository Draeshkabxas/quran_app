import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/providers/QuranProvider.dart';
import 'package:quran_app/providers/SettingsProvider.dart';
import 'package:quran_app/views/font.dart';
import 'package:quran_app/views/shared/StyleSupport.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'colors.dart';
import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> SettingsProvider()),
        ChangeNotifierProvider(create: (_)=> QuranProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: Locale("ar", "AE"),
        theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent
                ),
                elevation: 0, // This removes the shadow from all App Bars.
              ),
            // ••• ADD THIS: App Bar Theme: •••
            textTheme: GoogleFonts.elMessiriTextTheme(
              Theme.of(context).textTheme.apply(
                bodyColor: darkBrwon,
                displayColor: darkBrwon,
              ),
            ),

          ),
        debugShowCheckedModeBanner: false,
          home: const HomePage(title: 'Read Quran')),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _HomePageState(){
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 3000), () {
// Here you can write your code
      SettingsProvider provider=context.read<SettingsProvider>();
      QuranProvider quranProvider=context.read<QuranProvider>();
      provider.getSharePref();
      provider.getFontSize().then((value) => print("fs $value"));
      quranProvider.getData();
      print("Delay work");
      setState(() {
        // Here you can write your code for open new view
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context){
                  return HomeScreen();
                }));
      });

    });
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
        color: brown,
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
    );
  }
}


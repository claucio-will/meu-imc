import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meu_imc/pages/home_page2.dart';
import 'package:meu_imc/pages/result_page.dart';
import 'package:meu_imc/routes/app_routes.dart';
import 'package:meu_imc/theme/theme.dart';
import 'package:provider/provider.dart';

import 'models/ad_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initAdmob = MobileAds.instance.initialize();
  final adState = AdState(initAdmob);
  runApp(
    Provider.value(
      value: adState,
      builder: (context, child) => MyApp(),
    ));
  //runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu IMC',
      theme: ThemeApp.themeGlobal(),
      home: HomePage2(),
      routes: {
        AppRoutes.RESULT_PAGE: (_) => ResultPage(),
      },
    );
  }
}

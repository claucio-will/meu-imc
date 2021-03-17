import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meu_imc/components/card_height_age.dart';
import 'package:meu_imc/components/my_button.dart';
import 'package:meu_imc/controllers/home_controller.dart';
import 'package:meu_imc/models/ad_state.dart';
import 'package:meu_imc/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final homeCotroller = HomeController();

  BannerAd bannerAd;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final adState = Provider.of<AdState>(context);
    adState.initialization.then((status) {
      setState(() {
        bannerAd = BannerAd(
            adUnitId: adState.bannerAdUnitId,
            size: AdSize.banner,
            request: AdRequest(),
            listener: adState.listener)
          ..load();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MEU IMC',
          style: TextStyle(color: Colors.grey),
        ),
      ),
      body: RxBuilder(
        builder: (_) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Card(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                      color: Color(0xFF1D1F33),
                      child: Container(
                        padding: EdgeInsets.only(top: 15),
                        width: double.infinity,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('ALTURA',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white.withAlpha(90))),
                            SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${homeCotroller.height.value.toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontSize: 50, color: Colors.white)),
                                Text('cm',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, bottom: 40, right: 20),
                              child: Slider(
                                activeColor: Color(0xFFEB1555),
                                inactiveColor: Color(0xFFEB1555).withAlpha(40),
                                label: '${homeCotroller.height.value}',
                                min: 0,
                                max: 210,
                                value: homeCotroller.height.value,
                                onChanged: (newValue) {
                                  homeCotroller.height.value = newValue;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          CardHeightAge(
                            title: 'PESO',
                            subTitle: '${homeCotroller.weight.value}',
                            onPressedDec: homeCotroller.weight.value <= 0
                                ? null
                                : homeCotroller.decrement,
                            onPressedInc: homeCotroller.increment,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CardHeightAge(
                            title: 'IDADE',
                            subTitle: '${homeCotroller.age.value}',
                            onPressedDec: homeCotroller.age.value <= 0
                                ? null
                                : homeCotroller.decrementAge,
                            onPressedInc: homeCotroller.incrementAge,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              MyButton(
                onPressed: () {
                  homeCotroller.calcImc();
                  Navigator.of(context).pushNamed(
                    AppRoutes.RESULT_PAGE,
                    arguments: {
                      'height': homeCotroller.height.value,
                      'weight': homeCotroller.weight.value,
                      'age': homeCotroller.age.value,
                      'message': homeCotroller.message.value,
                      'imc': homeCotroller.imcText.value,
                      'imcNumber': homeCotroller.imcNumber.value,
                      'messageWarning': homeCotroller.messageWarning
                    },
                  );
                },
                title: 'CALCULAR IMC',
              ),
              if (bannerAd == null)
                Container(height: 50)
              else
                Container(
                  height: 50,
                  child: AdWidget(
                    ad: bannerAd,
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}

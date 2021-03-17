import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meu_imc/components/my_button.dart';
import 'package:meu_imc/models/ad_state.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  // BannerAd bannerAd;

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   final adState = Provider.of<AdState>(context);
  //   adState.initialization.then((status) {
  //     setState(() {
  //       bannerAd = BannerAd(
  //           adUnitId: adState.bannerAdUnitId,
  //           size: AdSize.banner,
  //           request: AdRequest(),
  //           listener: adState.listener)
  //         ..load();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final imcData =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color(0xFF090C21),
        centerTitle: true,
        title: Text(
          'MEU IMC',
          style: TextStyle(color: Colors.grey, fontSize: 20),
        ),
      ),
      backgroundColor: Color(0xFF090C21),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, left: 30),
            child: Text(
              'Seu resultado',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Card(
                  color: Color(0xFF1D1F33),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 45),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${imcData['messageWarning']}',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(height: 30),
                        Text(
                          '${imcData['imcNumber']}',
                          style: TextStyle(fontSize: 100, color: Colors.white),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Faixa do IMC:',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          '${imcData['imc']}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 25),
                        Text(
                          '${imcData['message']}',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'MINHA IDADE: ${imcData['age']}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 45),
                        // Container(
                        //   height: 50,
                        //   width: 200,
                        //   child: ElevatedButton(
                        //     style: ElevatedButton.styleFrom(
                        //       primary: Color(0xFF090C21), // background
                        //       onPrimary: Colors.white, // foreground
                        //     ),
                        //     onPressed: null,
                        //     child: Text(
                        //       'Salvar Resultado',
                        //       style: TextStyle(color: Colors.grey),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          MyButton(
            title: 'CALCULAR NOVAMENTE',
            onPressed: () => Navigator.of(context).pop(),
          ),
          //  if (bannerAd == null)
          //   Container(height: 50)
          // else
          //   Container(
          //     height: 50,
          //     child: AdWidget(
          //       ad: bannerAd,
          //     ),
          //   )
        ],
      ),
    );
  }
}

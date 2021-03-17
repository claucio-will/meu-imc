import 'package:flutter/material.dart';
import 'package:meu_imc/theme/theme.dart';

class CardHeightAge extends StatelessWidget {
  final String title;
  final String subTitle;
  final Function onPressedInc;
  final Function onPressedDec;

  CardHeightAge(
      {this.title, this.subTitle, this.onPressedInc, this.onPressedDec});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: ThemeApp.cardColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 30),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(color: Colors.white.withAlpha(90)),
              ),
              Text(subTitle,
                  style: TextStyle(fontSize: 50, color: Colors.white)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: 'desc',
                    backgroundColor: ThemeApp.buttonColor,
                    onPressed: onPressedDec,
                    child: Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    heroTag: 'inc',
                    backgroundColor: ThemeApp.buttonColor,
                    onPressed: onPressedInc,
                    child: Icon(Icons.add),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

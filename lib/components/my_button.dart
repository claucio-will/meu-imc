import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  MyButton({this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFEB1555), // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  double buttonheight;
  double buttonwidth;
  Color buttoncolor;
  String buttontext;
  double buttonborderraduios;
  FontWeight buttonfontwight;
  double buttonfontsize;
  Color buttonfontcolor;
  double elevation;
  bool hasicon;
  String icon;
  AppButton(
      {super.key,
        this.buttonborderraduios = 10,
        required this.buttoncolor,
        required this.buttonfontcolor,
        this.buttonfontsize = 17,
        this.buttonfontwight = FontWeight.w600,
        this.buttonheight = 55,
        required this.buttontext,
        this.elevation = 0,
        this.buttonwidth = double.infinity,
        this.hasicon = false,
        this.icon = ''});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(buttonborderraduios),
      child: Container(
        height: buttonheight,
        width: buttonwidth,
        decoration: BoxDecoration(
            color: buttoncolor,
            borderRadius: BorderRadius.circular(buttonborderraduios)),
        child: hasicon
            ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(' ',
                  style: TextStyle(
                      fontWeight: buttonfontwight,
                      color: Colors.black,
                      fontSize: buttonfontsize)),
              Text(buttontext,
                  style: TextStyle(
                      fontWeight: buttonfontwight,
                      color: buttonfontcolor,
                      fontSize: buttonfontsize)),
              // Lottie.asset(icon, height: 19),
            ],
          ),
        )
            : Center(
          child: Text(buttontext,
              style: TextStyle(
                  fontWeight: buttonfontwight,
                  color: buttonfontcolor,
                  fontSize: buttonfontsize)),
        ),
      ),
    );
  }
}

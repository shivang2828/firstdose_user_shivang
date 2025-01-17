import 'dart:ui';

import 'package:firstdose_user/Styles/ColorStyle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ColorStyle.dart';

class CustomTextStyles {
  static poppinsMediumBlack({required double fontSize}) => GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w500, fontSize: fontSize);
  static poppinsRegularBlack({required double fontSize}) => GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w400, fontSize: fontSize);
  static poppinsSemiBoldBlack({required double fontSize}) =>
      GoogleFonts.poppins(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: fontSize);
  static poppinsBoldBlack({required double fontSize}) => GoogleFonts.poppins(
      color: Colors.black, fontWeight: FontWeight.w700, fontSize: fontSize);
  static poppinsMediumWhite({required double fontSize}) => GoogleFonts.poppins(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: fontSize);
  static poppinsRegularWhite({required double fontSize}) => GoogleFonts.poppins(
      color: Colors.white, fontWeight: FontWeight.w400, fontSize: fontSize);
  static poppinsSemiBoldWhite({required double fontSize}) =>
      GoogleFonts.poppins(
          color: Colors.white, fontWeight: FontWeight.w600, fontSize: fontSize);
  static poppinsBoldWhite({required double fontSize}) => GoogleFonts.poppins(
      color: Colors.white, fontWeight: FontWeight.w700, fontSize: fontSize);
  static poppinsMediumTheme({required double fontSize}) => GoogleFonts.poppins(
      color: ColorStyle.themeColor,
      fontWeight: FontWeight.w500,
      fontSize: fontSize);
  static poppinsRegularTheme({required double fontSize}) => GoogleFonts.poppins(
      color: ColorStyle.themeColor,
      fontWeight: FontWeight.w400,
      fontSize: fontSize);
  static poppinsSemiBoldTheme({required double fontSize}) =>
      GoogleFonts.poppins(
          color: ColorStyle.themeColor,
          fontWeight: FontWeight.w600,
          fontSize: fontSize);
  static poppinsBoldTheme({required double fontSize}) => GoogleFonts.poppins(
      color: ColorStyle.themeColor,
      fontWeight: FontWeight.w700,
      fontSize: fontSize);
  static poppinsMediumCustom({
    required double fontSize,
    required Color color,
  }) =>
      GoogleFonts.poppins(
          color: color, fontWeight: FontWeight.w500, fontSize: fontSize);
  static poppinsRegularCustom({
    required double fontSize,
    required Color color,
  }) =>
      GoogleFonts.poppins(
          color: color, fontWeight: FontWeight.w400, fontSize: fontSize);
  static poppinsSemiBoldCustom({
    required double fontSize,
    required Color color,
  }) =>
      GoogleFonts.poppins(
          color: color, fontWeight: FontWeight.w600, fontSize: fontSize);
  static poppinsBoldCustom({
    required double fontSize,
    required Color color,
  }) =>
      GoogleFonts.poppins(
          color: color, fontWeight: FontWeight.w700, fontSize: fontSize);
}

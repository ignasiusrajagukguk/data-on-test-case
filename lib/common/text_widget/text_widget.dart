import 'package:data_on_test_case/common/text_widget/dimens.dart';
import 'package:data_on_test_case/common/text_widget/font_family.dart';
import 'package:flutter/material.dart';

class TextWidget {
  static Widget main(
    String text, {
    Color? color,
    TextAlign? align,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        fontSize: dimensTextSizeDefault,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget mainMediumBold(
    String text, {
    Color? color,
    TextAlign? align,
  }) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: openSansBold,
        fontSize: dimensTextSizeDefault,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget mainBold(String text,
      {Color? color, TextAlign? align, TextOverflow? overflow}) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: openSansBold,
        fontSize: dimensTextSizeMedium,
        color: color ?? Colors.black,
      ),
      overflow: overflow,
    );
  }

  static Widget mainReguler(String text, {Color? color, TextAlign? align}) {
    return Text(
      text,
      textAlign: align ?? TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.normal,
        fontFamily: openSansRegular,
        fontSize: dimensTextSizeDefault,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget medium(String text, {Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: dimensTextSizeMedium,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget mediumBold(String text, {Color? color, TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontSize: dimensTextSizeMedium,
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget mediumLargeBold(String text, {Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: openSansBold,
        fontSize: dimensTextSizeMediumLarge,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget mediumLarge(String text, {Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: openSansBold,
        fontSize: dimensTextSizeMediumLarge,
        color: color ?? Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  static Widget small(String text, {Color? color, TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: 'Open Sans',
        fontSize: dimensTextSizeSmall,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget smallBold(String text,
      {Color? color, TextOverflow? textOverflow}) {
    return Text(
      text,
      textAlign: TextAlign.left,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: dimensTextSizeSmall,
        fontFamily: openSansBold,
        color: color ?? Colors.black,
      ),
    );
  }

  static Widget smallX(String text,
      {Color? color,
      TextAlign? textAlign,
      TextOverflow? textOverflow,
      TextDecoration? decoration}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: dimensTextSizeSmallX,
        color: color ?? Colors.black,
        decoration: decoration,
      ),
    );
  }

  static Widget smallXXS(String text,
      {Color? color,
      TextAlign? textAlign,
      TextOverflow? textOverflow,
      TextDecoration? decoration}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: dimensTextSizeSmallXX,
        color: color ?? Colors.black,
        decoration: decoration,
      ),
    );
  }

  static Widget smallXParagraph(String text,
      {Color? color,
      TextAlign? textAlign,
      TextOverflow? textOverflow,
      TextDecoration? decoration}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow,
      style: TextStyle(
          fontSize: dimensTextSizeSmallX,
          color: color ?? Colors.black,
          decoration: decoration,
          height: 2),
    );
  }

  static Widget smallXX(String text,
      {Color? color,
      TextAlign? textAlign,
      TextOverflow? textOverflow,
      TextDecoration? decoration}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      overflow: textOverflow,
      style: TextStyle(
        fontSize: dimensTextSizeSmallX,
        color: color ?? Colors.black,
        decoration: decoration,
      ),
    );
  }

  static Widget mediumBoldOpenCamera(String text, {Color? color}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: "Open Sans",
        fontSize: dimensTextSizeMedium,
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

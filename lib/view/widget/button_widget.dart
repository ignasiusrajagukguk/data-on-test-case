import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

class ButtonWidget {
  static Widget greyImageOnLeft(BuildContext context, String text, String asset,
      {double? width, action}) {
    return ElevatedButton(
      onPressed: action,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(ConstColors.gray40),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        //width: width ?? MediaQuery.of(context).size.width,
        width: width,
        height: 42,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(asset, width: 14),
            Container(width: 10),
            TextWidget.small(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  static Widget basic(
    BuildContext context,
    String text, {
    double? width,
    double? height = 42,
    action,
    double? borderRadius,
    Color? backgroundColor,
    Color? textColor,
    EdgeInsets? contentPadding = const EdgeInsets.all(10),
  }) {
    return TextButton(
      onPressed: action,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        backgroundColor:
            MaterialStateProperty.all(backgroundColor ?? ConstColors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
      ),
      child: Container(
        padding: contentPadding,
        width: width,
        height: height,
        child: Center(
          child: TextWidget.small(text,
              textAlign: TextAlign.center, color: textColor),
        ),
      ),
    );
  }

  /// contextless buttons
  static Widget suffixIconedButton(
      {required String text,
      required Widget suffix,
      double? width,
      Function()? onTap,
      Color buttonColor = ConstColors.gray20,
      Color textColor = ConstColors.dark50}) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(ConstColors.gray20),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: FittedBox(
                child: suffix,
              ),
            ),
            SeparatorWidget.width6(),
            TextWidget.small(text, color: textColor)
          ],
        ),
      ),
    );
  }
}

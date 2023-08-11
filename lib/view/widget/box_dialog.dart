import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/constants/assets_image.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

class BoxDialog {
  static Widget dialogErrorUploadResume(
      BuildContext context, String title, String desc) {
    return Material(
      child: ClipRRect(
        child: AlertDialog(
          content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(assetsImagesXCircle),
                ),
                TextWidget.mainBold(title),
                SeparatorWidget.height16(),
                TextWidget.smallBold(desc),
                SeparatorWidget.height16(),
                button(
                  context,
                  'Close',
                  action: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: ConstColors.blue30,
                  textColor: ConstColors.white,
                ),
              ]),
        ),
      ),
    );
  }

  static Widget button(
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
          child: TextWidget.small(
            text,
          )),
    );
  }
}

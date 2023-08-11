import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/constants/assets_image.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:data_on_test_case/view/widget/button_widget.dart';
import 'package:flutter/material.dart';

class BottoSheetWidget {
  static Widget _baseSheet({Widget? child}) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      child: Container(
        constraints: const BoxConstraints(minHeight: 150),
        padding: const EdgeInsets.fromLTRB(24, 0, 34, 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_topIndicator(), child!],
        ),
      ),
    );
  }

  static Widget _topIndicator() {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: ConstColors.gray30,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
        ),
        height: 5,
        width: 80,
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      ),
    );
  }

  static Widget imagePickerOptions({
    Function()? onTapCamera,
    Function()? onTapGalery,
  }) {
    return _baseSheet(
      child: Builder(builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextWidget.mediumBoldOpenCamera('Edit Photo',
                  color: ConstColors.dark50),
              SeparatorWidget.height16(),
              ButtonWidget.suffixIconedButton(
                suffix: Image.asset(assetsImagesIcCamera,
                    color: ConstColors.gray40),
                text: 'Buka Kamera',
                onTap: onTapCamera,
              ),
              SeparatorWidget.height16(),
              ButtonWidget.suffixIconedButton(
                suffix: const Icon(
                  Icons.image,
                  color: ConstColors.gray40,
                ),
                text: 'Buka galeri',
                onTap: onTapGalery,
              ),
              SeparatorWidget.height16(),
            ],
          ),
        );
      }),
    );
  }
}

import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/constants/assets_image.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:flutter/material.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          assetsImageStarGold,
          height: 20,
        ),
        Image.asset(
          assetsImageStarGold,
          height: 20,
        ),
        Image.asset(
          assetsImageStarGold,
          height: 20,
        ),
        Image.asset(
          assetsImageStarGold,
          height: 20,
        ),
        Image.asset(
          assetsImageStar,
          height: 20,
          color: ConstColors.white,
        ),
        SeparatorWidget.width6(),
        TextWidget.small("(4.0)", color: ConstColors.white)
      ],
    );
  }
}

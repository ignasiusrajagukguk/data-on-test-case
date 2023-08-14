import 'dart:io';

import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/constants/assets_image.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:data_on_test_case/provider/university_list_provider.dart';
import 'package:data_on_test_case/view/widget/bottom_sheet.dart';
import 'package:data_on_test_case/view/widget/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfilePicture extends StatelessWidget {
  final String? name;
  final Function(XFile image)? onTakeImage;
  final Function()? onTakeImageFailure;

  const EditProfilePicture(
      {Key? key,
      this.onTakeImage,
      this.onTakeImageFailure,
      this.name,})
      : super(key: key);

  void _onImageChange(ImageSource source, EditProfilePicture widget) async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: source, imageQuality: 50);
    if (widget.onTakeImage != null && image != null) {
      widget.onTakeImage!(image);
    } else {
      if (widget.onTakeImageFailure != null) {
        widget.onTakeImageFailure!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityListProvider>(
        builder: (context, provider, child) {
      return Row(
        children: [
          if (provider.imagePath == null || provider.imagePath == 'error' || provider.imagePath == '')
            Container(
              margin: const EdgeInsets.all(9.1),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: ConstColors.gray20),
              height: 98,
              width: 98,
              child: const Icon(Icons.person,
                color: ConstColors.dark50,
                size: 70,
              ),
            )
          else
            Container(
              margin: const EdgeInsets.all(9.1),
              child: CircleAvatar(
                radius: 49,
                backgroundImage: FileImage(File(provider.imagePath ?? '')),
              ),
            ),
          SeparatorWidget.width12(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget.mainBold(
                  name ?? 'Name',
                  color: ConstColors.dark60,
                ),
                SeparatorWidget.height16(),
                Row(
                  children: [
                    ButtonWidget.greyImageOnLeft(
                      context,
                      'Edit photo',
                      assetsImagesIcCamera,
                      action: () async {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              BottoSheetWidget.imagePickerOptions(
                            onTapCamera: () async {
                              Navigator.pop(context);
                              _onImageChange(ImageSource.camera, this);
                            },
                            onTapGalery: () async {
                              Navigator.pop(context);
                              _onImageChange(ImageSource.gallery, this);
                            },
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

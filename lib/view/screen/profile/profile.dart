import 'dart:io';

import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:data_on_test_case/provider/university_list_provider.dart';
import 'package:data_on_test_case/view/widget/edit_photo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatefulWidget {
  final User user;
  const ProfileWidget({super.key, required this.user});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityListProvider>(
        builder: (context, provider, child) {
      return CupertinoPageScaffold(
        backgroundColor: ConstColors.white,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          editPictureWidget(provider),
          SeparatorWidget.height24(),
          ElevatedButton(
              style: ButtonStyle(
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                backgroundColor: MaterialStateProperty.all(ConstColors.blue10),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              onPressed: () {
                Provider.of<UniversityListProvider>(context, listen: false)
                    .doLogOutUser(context);
              },
              child: TextWidget.small('Log Out'))
        ]),
      );
    });
  }

  Widget editPictureWidget(UniversityListProvider provider) {
    ImageProvider image = const NetworkImage('');
    if (provider.imagePerson != null) {
      final path = provider.imagePerson?.path;
      final file = File(path ?? '');
      image = FileImage(file);
    }
    return EditPicture(
      isPerson: true,
      image: image,
      name: widget.user.email,
      onTakeImage: (file) {
        provider.updateImagePerson(file);
      },
      onTakeImageFailure: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 1500),
            backgroundColor: Colors.red,
            content: Text('Edit photo gagal'),
            behavior: SnackBarBehavior.floating,
            //margin: EdgeInsets.only(bottom: 400.0),
          ),
        );
      },
    );
  }
}

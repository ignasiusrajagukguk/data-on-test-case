import 'dart:io';

import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:data_on_test_case/provider/university_list_provider.dart';
import 'package:data_on_test_case/view/model/university_model.dart';
import 'package:data_on_test_case/view/widget/edit_photo.dart';
import 'package:data_on_test_case/view/widget/ratings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UniversityDetailArgument {
  UniversityModel? universityModel;

  UniversityDetailArgument({required this.universityModel});
}

class UniversityDetail extends StatefulWidget {
  final UniversityDetailArgument argument;
  const UniversityDetail({super.key, required this.argument});

  @override
  State<UniversityDetail> createState() => _UniversityDetailState();
}

class _UniversityDetailState extends State<UniversityDetail> {
  @override
  void initState() {
    final provider =
        Provider.of<UniversityListProvider>(context, listen: false);
    provider.updateImage(XFile(''));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityListProvider>(
        builder: (context, provider, child) {
      ImageProvider image = const NetworkImage('');
      if (provider.image != null) {
        final path = provider.image?.path;
        final file = File(path ?? '');
        image = FileImage(file);
      }
      return Scaffold(
        backgroundColor: ConstColors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ConstColors.white,
          leadingWidth: 64,
          actions: [
            Container(
              width: 64,
            )
          ],
          titleSpacing: 0,
          title: Center(
            child: TextWidget.mainBold(
              'Detail University',
              color: ConstColors.dark60.withOpacity(0.8),
            ),
          ),
          leading: IconButton(
            padding: const EdgeInsets.all(0),
            icon: const Icon(
              Icons.arrow_back,
              size: 20,
              color: ConstColors.dark60,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      EditUniversityPicture(
                        image: image,
                        name: widget.argument.universityModel?.name,
                        onTakeImage: (file) {
                          provider.updateImage(file);
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
                      ),
                    ],
                  ),
                  SeparatorWidget.height20(),
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: ConstColors.dark60,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextWidget.smallBold(
                          'Website',
                          color: ConstColors.white.withOpacity(0.8),
                        ),
                        TextWidget.smallBold(
                          widget.argument.universityModel?.webPages?[0] ?? '',
                          color: ConstColors.white.withOpacity(0.8),
                        ),
                        SeparatorWidget.height3(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.place,
                              color: ConstColors.white,
                              size: 12,
                            ),
                            SeparatorWidget.width6(),
                            TextWidget.smallBold(
                              widget.argument.universityModel?.country ?? '',
                              color: ConstColors.white.withOpacity(0.8),
                            ),
                          ],
                        ),
                        SeparatorWidget.height3(),
                        const Ratings(),
                      ],
                    ),
                  ),
                  SeparatorWidget.height20(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

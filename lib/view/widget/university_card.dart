import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/constants/assets_image.dart';
import 'package:data_on_test_case/common/router/routes.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:data_on_test_case/provider/university_list_provider.dart';
import 'package:data_on_test_case/view/detail_university/detail_university.dart';
import 'package:data_on_test_case/view/model/university_model.dart';
import 'package:data_on_test_case/view/widget/button_widget.dart';
import 'package:data_on_test_case/view/widget/refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class UniversityListContent {
  static Widget allUniversityTabView(
      String valueSearch,
      UniversityListProvider provider,
      BuildContext context,
      ScrollController scrollController) {
    return RefreshIndicatorWidget.main(
      onRefresh: () =>
          Provider.of<UniversityListProvider>(context, listen: false)
              .getAllUniversity(name: '', startFromZero: true),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        children: [
          provider.isLoading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SeparatorWidget.height20(),
                    Lottie.asset(assetsLoading,
                        width: MediaQuery.of(context).size.width),
                  ],
                )
              : provider.universityList.isEmpty
                  ? Column(
                      children: [
                        Lottie.asset(assetsEmptyState,
                            width: MediaQuery.of(context).size.width,
                            height: 200),
                        TextWidget.mediumLargeBold('Empty Data',
                            color: ConstColors.dark50.withOpacity(0.8)),
                        SeparatorWidget.height24(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: ButtonWidget.basic(context, 'Retry',
                              action: () {
                            Provider.of<UniversityListProvider>(context,
                                    listen: false)
                                .getAllUniversity(
                                    name: valueSearch, startFromZero: true);
                          },
                              backgroundColor: ConstColors.red40,
                              textColor: ConstColors.white),
                        )
                      ],
                    )
                  : Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: provider.universityList.length >= 20
                            ? provider.universityList.length + 1
                            : provider.universityList.length,
                        itemBuilder: (context, index) {
                          if (index == provider.universityList.length) {
                            return Center(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                margin: const EdgeInsets.fromLTRB(0, 10, 0, 50),
                                child: const SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    color: ConstColors.blue30,
                                    strokeWidth: 4.0,
                                  ),
                                ),
                              ),
                            );
                          }
                          return universityCard(
                              provider.universityList[index],
                              () => Navigator.pushNamed(
                                  context, Routes.detailUniversity,
                                  arguments: UniversityDetailArgument(
                                      universityModel:
                                          provider.universityList[index])),
                              index);
                        },
                      ),
                    ),
        ],
      ),
    );
  }

  static Widget allUniversityTabViewCategory(
    UniversityListProvider provider,
    List<UniversityModel> universityModelList,
    BuildContext context,
    List<String> filterList,
  ) {
    return RefreshIndicatorWidget.main(
      onRefresh: () =>
          Provider.of<UniversityListProvider>(context, listen: false)
              .getAllUniversity(name: '', startFromZero: false),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          if (provider.isLoading != true)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
              child: TextWidget.mainBold(
                  '${universityModelList.length} University Found',
                  color: ConstColors.white.withOpacity(0.8)),
            ),
          provider.isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Lottie.asset(assetsLoading,
                      width: MediaQuery.of(context).size.width),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: universityModelList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return UniversityListContent.universityCard(
                          universityModelList[index],
                          () => Navigator.pushNamed(
                              context, Routes.detailUniversity,
                              arguments: UniversityDetailArgument(
                                  universityModel:
                                      provider.universityList[index])),
                          index);
                    },
                  ),
                ),
        ],
      ),
    );
  }

  static Widget universityCard(
      UniversityModel universityModel, Function() onClick, int index) {
    return InkWell(
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 5, left: 5, top: 10, right: 5),
          child: Container(
            decoration: BoxDecoration(
              color: index % 2 == 0 ? ConstColors.white : ConstColors.blue10,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: ConstColors.dark60.withOpacity(0.5),
                  offset: const Offset(0, 1),
                  blurRadius: 5,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  height: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: const Icon(Icons.school)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SeparatorWidget.height6(),
                    SizedBox(
                      width: 300,
                      child: TextWidget.smallBold(universityModel.name ?? '',
                          color: ConstColors.dark50,
                          textOverflow: TextOverflow.ellipsis),
                    ),
                    SeparatorWidget.height6(),
                    TextWidget.smallXXS(universityModel.country ?? '',
                        color: ConstColors.dark50.withOpacity(0.5),
                        textOverflow: TextOverflow.ellipsis),
                    SeparatorWidget.height3(),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

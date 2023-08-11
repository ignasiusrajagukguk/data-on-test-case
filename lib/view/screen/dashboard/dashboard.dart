import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/provider/university_list_provider.dart';
import 'package:data_on_test_case/view/widget/refresh_indicator.dart';
import 'package:data_on_test_case/view/widget/university_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  final ScrollController scrollController;
  final String? searchValue;
  const Dashboard({super.key, this.searchValue,  required this.scrollController});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UniversityListProvider>(
        builder: (context, provider, child) {
      return CupertinoPageScaffold(
          backgroundColor: ConstColors.white,
          child: RefreshIndicatorWidget.main(
            onRefresh: () async {
              Provider.of<UniversityListProvider>(context, listen: false)
                  .getAllUniversity(name: '', startFromZero: true);
            },
            child: UniversityListContent.allUniversityTabView(
                widget.searchValue ?? '', provider, context, widget.scrollController),
          ));
    });
  }
}

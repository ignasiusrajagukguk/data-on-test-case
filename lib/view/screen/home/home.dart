import 'package:data_on_test_case/common/colors.dart';
import 'package:data_on_test_case/common/separator_widget.dart';
import 'package:data_on_test_case/common/text_widget/text_widget.dart';
import 'package:data_on_test_case/provider/university_list_provider.dart';
import 'package:data_on_test_case/view/screen/dashboard/dashboard.dart';
import 'package:data_on_test_case/view/screen/profile/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _tabController;
  late User user;
  late PageController _pageCtl;
  List<String> filterList = [
    'Home',
    'Profile',
  ];
  int page = 1;
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();
  @override
  void initState() {
    user = FirebaseAuth.instance.currentUser!;
    _pageCtl = PageController(initialPage: 0, keepPage: true);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Provider.of<UniversityListProvider>(context, listen: false)
            .getAllUniversity(name: '', startFromZero: false);
      }
    });

    searchController = TextEditingController()
      ..addListener(() {
        _searchListener();
      });
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this)
      ..addListener(() {
        if (_tabController.index != _tabController.previousIndex) {}
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider =
          Provider.of<UniversityListProvider>(context, listen: false);
      provider.updateCurrentIndex(0);
      provider.getAllUniversity(name: '', startFromZero: true);
    });
    super.initState();
  }

  void _searchListener() {
    final value = searchController.text;
    if (value.isNotEmpty) {
      Provider.of<UniversityListProvider>(context, listen: false)
          .getAllUniversity(name: value, startFromZero: true);
    } else {
      Provider.of<UniversityListProvider>(context, listen: false)
          .getAllUniversity(name: '', startFromZero: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          Consumer<UniversityListProvider>(builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ConstColors.white,
            leadingWidth: 64,
            titleSpacing: 0,
            toolbarHeight: 80,
            title: provider.currentIndex == 0
                ? SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 0),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.search,
                                color: ConstColors.dark40,
                              ),
                              SeparatorWidget.height16(),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Masukkan kata kunci...',
                                    border: InputBorder.none,
                                  ),
                                  controller: searchController,
                                  focusNode: searchFocus,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Center(child: TextWidget.mediumBold('Profile')),
          ),
          body: PageView(
            controller: _pageCtl,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Dashboard(
                  searchValue: searchController.text,
                  scrollController: scrollController),
              ProfileWidget(
                user: user,
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: provider.currentIndex,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile')
            ],
            onTap: (value) {
              provider.updateCurrentIndex(value);
              _pageCtl.animateToPage(
                value,
                curve: Curves.linear,
                duration: const Duration(milliseconds: 100),
              );
            },
          ),
        );
      }),
    );
  }
}

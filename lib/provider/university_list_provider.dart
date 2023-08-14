import 'package:data_on_test_case/common/router/routes.dart';
import 'package:data_on_test_case/view/model/university_model.dart';
import 'package:data_on_test_case/view/model/paging.dart';
import 'package:data_on_test_case/view/widget/box_dialog.dart';
import 'package:data_on_test_case/view_model/aunthentication.dart';
import 'package:data_on_test_case/view_model/shared_preferences/local_storage.dart';
import 'package:data_on_test_case/view_model/shared_preferences/prefrences_key.dart';
import 'package:data_on_test_case/view_model/shared_preferences/shared_prefrences_utils.dart';
import 'package:data_on_test_case/view_model/university_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UniversityListProvider with ChangeNotifier {
  final UniversityListService _service = UniversityListService();
  final Authentication _serviceAuthentication = Authentication();
  final LocalStorage _localStorage = LocalStorage();
  bool isLoading = false;
  BuildContext? _dialogContext;
  int currentIndex = 0;
  String? imagePath = '';
  XFile? image = XFile('');

  List<UniversityModel> _universityList = [];
  List<UniversityModel> get universityList => _universityList;
  Paging request = Paging()
    ..page = 1
    ..perPage = 20;

  Future<void> getAllUniversity(
      {required bool startFromZero, String? name}) async {
    if (startFromZero) {
      request
        ..page = 1
        ..perPage = 20;
    } else {
      int currentPage = request.page!;
      request
        ..page = currentPage + 1
        ..perPage = 20;
    }
    if (startFromZero) {
      isLoading = true;
    }
    notifyListeners();

    final response = await _service.getUniversityList(
        name ?? '', request.page ?? 1, request.perPage ?? 10);
    if (startFromZero) {
      _universityList = response;
    } else {
      _universityList.addAll(response);
    }
    if (startFromZero) {
      isLoading = false;
    }
    notifyListeners();
  }

  bool containsAny(String text, List<String> substrings) {
    // returns true if any substring of the [substrings] list is contained in the [text]
    for (var substring in substrings) {
      if (text.contains(substring)) return true;
    }
    return false;
  }

  Future<void> doLoginUser(BuildContext context,
      {required String email,
      required String password,
      String? title,
      String? desc}) async {
    _dialogContext = context;
    final response = await _serviceAuthentication.doLoginUser(email, password);
    if (response is FirebaseAuthException) {
      FirebaseAuthException responseError = response;
      _dialogContext = context;
      String? messageError;

      if (responseError.code == 'user-not-found') {
        messageError = 'email is not registered';
      } else if (responseError.code == 'wrong-password') {
        messageError = 'password is not valid';
      }
      showDialogError(_dialogContext!, 'Login Failed',
          messageError ?? responseError.message ?? '');
    } else {
      await _localStorage.doSetCacheLoggedIn('isLoggedIn');
      Navigator.of(_dialogContext!).pushNamedAndRemoveUntil(
        Routes.home,
        (route) => false,
      );
    }
    return response;
  }

  Future<void> doRegisterUser(BuildContext context,
      {required String email,
      required String password,
      String? title,
      String? desc}) async {
    _dialogContext = context;
    final response =
        await _serviceAuthentication.doRegisterUser(email, password);
    if (response is FirebaseAuthException) {
      FirebaseAuthException responseError = response;
      _dialogContext = context;
      String? messageError;
      showDialogError(_dialogContext!, 'Register Failed',
          messageError ?? responseError.message ?? '');
    } else {
      await _localStorage.doSetCacheLoggedIn('isLoggedIn');
      Navigator.of(_dialogContext!).pushNamedAndRemoveUntil(
        Routes.home,
        (route) => false,
      );
    }
    return response;
  }

  Future<void> doLogOutUser(BuildContext context) async {
    _dialogContext = context;
    final response = await _serviceAuthentication.doLogOutUser();
    await _localStorage.doClearCacheUser();
    Navigator.of(_dialogContext!).pushNamedAndRemoveUntil(
      Routes.loginScreen,
      (route) => false,
    );
    return response;
  }

  void showDialogError(BuildContext context, String title, String desc) async {
    await showDialog<bool>(
        context: context,
        builder: (context) {
          return BoxDialog.dialogErrorUploadResume(context, title, desc);
        });
  }

  updateCurrentIndex(int newcurrentIndex) {
    currentIndex = newcurrentIndex;
    notifyListeners();
  }

  updateImage(XFile file) {
    image = file;
    notifyListeners();
  }

  updateImagePerson() async {
    String? localImagePath =
        await SharedPreferencesUtils.getString(preferencesPersonalImage);
    imagePath = localImagePath;
    notifyListeners();
  }
}

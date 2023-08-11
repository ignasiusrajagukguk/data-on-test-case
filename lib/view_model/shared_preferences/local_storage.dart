import 'package:data_on_test_case/view_model/shared_preferences/prefrences_key.dart';
import 'package:data_on_test_case/view_model/shared_preferences/shared_prefrences_utils.dart';

class LocalStorage {
  Future<bool> doSetCacheLoggedIn(String status) async =>
      await SharedPreferencesUtils.setString(preferencesLoggedIn, status);
  

  Future<void> doClearCacheUser() async =>
      await SharedPreferencesUtils.clear(key: preferencesLoggedIn);
}

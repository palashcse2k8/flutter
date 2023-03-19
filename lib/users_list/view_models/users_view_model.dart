
import 'package:flutter/material.dart';
import 'package:flutterbascis/users_list/repo/api_status.dart';
import 'package:flutterbascis/users_list/repo/user_services.dart';

import '../models/user_error.dart';
import '../models/users_list_model.dart';

class UserViewModel extends ChangeNotifier {
  bool _loading = false;
  List<UserModel> _userListModel = [];
  late UserError _userError;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  seLoading (bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError (UserError userError) {
    _userError = userError;
  }

  getUsers () async {
    seLoading(true);
    var response = await UserServices.getUserList();

    if (response is Success) {
      setUserListModel(response.response as List<UserModel>);
    }

    if (response is Failure) {
      UserError userError = UserError(code: response.code, message: response.errorResponse);
      setUserError(userError);
    }
    seLoading(false);
  }
}
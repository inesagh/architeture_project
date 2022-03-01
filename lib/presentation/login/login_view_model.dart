import 'dart:async';

import 'package:architeture_project/presentation/base/base_view_model.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("",
      ""); //when user can make typos and change smth. (data classes)   freezed pkg.

  @override
  void dispose() {
    _usernameStreamController.close();
    _passwordStreamController.close();
  }

  @override
  void start() {}

  //INPUTS
  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
  }

  //OUTPUTS
  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((enteredPassword) => _isPasswordValid(enteredPassword));

  @override
  Stream<bool> get outputIsUsernameValid => _usernameStreamController.stream
      .map((enteredUsername) => _isUsernameValid(enteredUsername));

//  private func
  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }
}

abstract class LoginViewModelInputs {
//  3 funcs
  setUsername(String username);

  setPassword(String password);

  login();

//  2 sinks
  Sink get inputUsername;

  Sink get inputPassword;
}

abstract class LoginViewModelOutputs {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;
}

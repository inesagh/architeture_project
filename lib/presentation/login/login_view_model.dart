import 'dart:async';

import 'package:architeture_project/domain/usecase/login_usecase.dart';
import 'package:architeture_project/presentation/base/base_view_model.dart';

import '../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs {
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  var loginObject = LoginObject("",
      ""); //when user can make typos and change smth. (data classes)   freezed pkg.

  LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

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
  login() async {
    (await _loginUseCase.execute(
            LoginUseCaseInput(loginObject.username, loginObject.password)))
        .fold(
            (failure) => {
                  //      left -> failure
                  print(failure.message)
                },
            (data) => {
                  // right -> success (data)
                  print(data.customer?.name)
                });

    //      fold closure, either
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(
        password: password); //data class operation same as kotlin
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(
        username: username); //data class operation same as kotlin
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

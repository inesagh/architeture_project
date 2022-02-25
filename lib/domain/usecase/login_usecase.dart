import 'package:architeture_project/data/network/failure.dart';
import 'package:architeture_project/data/requests/requests.dart';
import 'package:architeture_project/domain/model/model.dart';
import 'package:architeture_project/domain/repository/repository.dart';
import 'package:architeture_project/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    return await _repository
        .login(LoginRequest(input.email, input.password, "imei", "deviceType"));
  }
}

//viewmodel - (login use case input) -> login use case
class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}

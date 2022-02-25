import 'package:architeture_project/data/network/failure.dart';
import 'package:architeture_project/data/requests/requests.dart';
import 'package:architeture_project/domain/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}

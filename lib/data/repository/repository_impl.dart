import 'package:architeture_project/data/datasource/remote_data_source.dart';
import 'package:architeture_project/data/mapper/mapper.dart';
import 'package:architeture_project/data/network/failure.dart';
import 'package:architeture_project/data/network/network_info.dart';

import 'package:architeture_project/data/requests/requests.dart';

import 'package:architeture_project/domain/model.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      final response = await _remoteDataSource.login(loginRequest);

      if (response.status == 0) {
        return Right(response.toDomain());
      } else {
        return Left(Failure(409,
            response.message ?? "smth has gone wrong in our business logic"));
      }
    } else {
      return Left(Failure(501, "please, check your internet connection"));
    }
  }
}

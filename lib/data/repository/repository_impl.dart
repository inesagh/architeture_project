import 'package:architeture_project/data/datasource/remote_data_source.dart';
import 'package:architeture_project/data/mapper/mapper.dart';
import 'package:architeture_project/data/network/error_handler.dart';
import 'package:architeture_project/data/network/failure.dart';
import 'package:architeture_project/data/network/network_info.dart';

import 'package:architeture_project/data/requests/requests.dart';

import 'package:architeture_project/domain/model/model.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;

  RepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessages.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}

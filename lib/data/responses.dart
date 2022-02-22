import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/json_serializable.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey()
  int? status;
  @JsonKey()
  String? message;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CustomerResponse {
  @JsonKey()
  int? id;
  @JsonKey()
  String? name;
  @JsonKey()
  int? numberOfNotifications;
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey()
  String? phone;
  @JsonKey()
  String? link;
  @JsonKey()
  String? email;
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey()
  CustomerResponse? customer;
  @JsonKey()
  ContactsResponse? contacts;
}

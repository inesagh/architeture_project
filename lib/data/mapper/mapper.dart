//response - (null checking) - model

import 'package:architeture_project/data/responses/responses.dart';
import 'package:architeture_project/domain/model/model.dart';
import 'package:architeture_project/app/extensions.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomerResponse {
  Customer toDomain() {
    return Customer(id?.orZero() ?? ZERO, name?.orEmpty() ?? EMPTY,
        numberOfNotifications?.orZero() ?? ZERO);
  }
}

extension ContactsResponseMapper on ContactsResponse {
  Contacts toDomain() {
    return Contacts(phone?.orEmpty() ?? EMPTY, link?.orEmpty() ?? EMPTY,
        email?.orEmpty() ?? EMPTY);
  }
}

extension AuthenticationResponseMapper on AuthenticationResponse {
  Authentication toDomain() {
    return Authentication(customer?.toDomain(), contacts?.toDomain());
  }
}

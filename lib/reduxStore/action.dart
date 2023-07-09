import '../models/addressAndPhone.dart';
import '../models/food_and_category.dart';

class SetAddressAndPhoneAction {
  final AddressAndPhone addressAndPhone;

  SetAddressAndPhoneAction(this.addressAndPhone);
}

class SetLPGAction {
  final LPG lpg;

  SetLPGAction(this.lpg);
}

class SetLPGListAction {
  final List<LPG> lpgList;

  SetLPGListAction(this.lpgList);
}

enum CartActionType {
  addItem,
  removeItem,
  clearCart,
}

class CartAction {
  final CartActionType type;
  final dynamic payload;

  CartAction(this.type, {this.payload});
}

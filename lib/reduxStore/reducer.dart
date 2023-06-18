// Reducer for a single lpg item
import '../addressPage/address_add.dart';
import '../models/addressAndPhone.dart';
import '../models/cart.dart';
import '../models/food_and_category.dart';
import '../models/user.dart';
import 'action.dart';
import 'app_state.dart';


AppState appReducer(AppState state, dynamic action) {
  return AppState(
    cart:cartReducer(state.cart, action),
    lpg: lpgReducer(state.lpg, action),
    addressAndPhone: addressAndPhoneReducer(state.addressAndPhone, action),
    lpgList: lpgListReducer(state.lpgList, action),
    // user: userReducer(state.user, action),
  );
}

// reducer for address and phone
AddressAndPhone addressAndPhoneReducer(AddressAndPhone addressAndPhone, dynamic action) {
  if (action is SetAddressAndPhoneAction) {
    return action.addressAndPhone;
  }
  return addressAndPhone ;
}

LPG lpgReducer(LPG lpg, dynamic action) {
  if (action is SetLPGAction) {
    return action.lpg;
  }
  return lpg;
}

// Reducer for a list of lpg items
List<LPG> lpgListReducer(List<LPG> lpgList, dynamic action) {
  if (action is SetLPGListAction) {
    return action.lpgList;
  }
  return lpgList;
}


// Reducer for a user
// User userReducer(User user, dynamic action) {
//   if (action is SetUserAction) {
//     return action.user;
//   }
//   return user;
// }

Cart cartReducer(Cart state,  action) {
  final newState = Cart();
  newState.lpg.addAll(state.lpg);
if(action is CartAction){

  switch (action.type) {
    case CartActionType.addItem:
      final item = action.payload;
      newState.addItem(item);
      break;
    case CartActionType.removeItem:
      newState.removeItem(action.payload);
      break;
    case CartActionType.clearCart:
      newState.clearCart();
      break;
  }
}
  // print(newState.lpg);
saveCartToSession(newState);
// print(getCartFromSession());
  return newState;
}

import 'package:redux/redux.dart';
import '../models/addressAndPhone.dart';
import '../models/cart.dart';
import '../models/food_and_category.dart';
import 'reducer.dart';

class AppState {
  final LPG lpg;
  final List<LPG> lpgList;
  final AddressAndPhone addressAndPhone;
  final Cart cart;

  AppState(
      {required this.lpg,
      required this.lpgList,
      required this.addressAndPhone,
      required this.cart});
  factory AppState.initialState() => AppState(
      lpg: LPG(),
      lpgList: [],
      addressAndPhone: AddressAndPhone(),
      cart: Cart());
}

final store =
    Store<AppState>(appReducer, initialState: AppState.initialState());

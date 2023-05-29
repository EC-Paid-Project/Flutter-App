import 'package:redux/redux.dart';

import '../models/food_and_category.dart';
import '../models/user.dart';
import 'reducer.dart';

// Define the state class that holds the data
class AppState {
  final Food food;
  final List<Food> foodList;
  final User user;

  AppState({required this.food, required this.foodList, required this.user});
}

// Combine the reducers
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    food: foodReducer(state.food, action),
    foodList: foodListReducer(state.foodList, action),
    user: userReducer(state.user, action),
  );
}

// Create the Redux store
final store = Store<AppState>(
  appReducer,
  initialState: AppState(food: Food(1,"",3.4,""), foodList: [], user: User(-1,"","","")),
);

// Reducer for a single food item
import '../models/food_and_category.dart';
import '../models/user.dart';
import 'action.dart';
import 'app_state.dart';


AppState appReducer(AppState state, dynamic action) {
  return AppState(
    food: foodReducer(state.food, action),
    foodList: foodListReducer(state.foodList, action),
    user: userReducer(state.user, action),
  );
}



Food foodReducer(Food food, dynamic action) {
  if (action is SetFoodAction) {
    return action.food;
  }
  return food;
}

// Reducer for a list of food items
List<Food> foodListReducer(List<Food> foodList, dynamic action) {
  if (action is SetFoodListAction) {
    return action.foodList;
  }
  return foodList;
}

// Reducer for a user
User userReducer(User user, dynamic action) {
  if (action is SetUserAction) {
    return action.user;
  }
  return user;
}

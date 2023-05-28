class Food {
  int foodId=-1;
  int categoryId;
  String name;
  double price;

  Food( this.categoryId, this.name, this.price);

  Food.fromJson(Map<String, dynamic> json)
      : foodId = json['food_id'],
        categoryId = json['category_id'],
        name = json['name'],
        price = json['price'];

  Map<String, dynamic> toJson() => {
        'category_id': categoryId,
        'name': name,
        'price': price,
      };
}





class Category {
  int categoryId=-1;
  String name;

  Category( this.name);

  Category.fromJson(Map<String, dynamic> json)
      : categoryId = json['category_id'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
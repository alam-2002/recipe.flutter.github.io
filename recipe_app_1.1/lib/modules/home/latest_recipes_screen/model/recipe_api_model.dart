class RecipeApiModel {
  String? image, url, source, label;
  List<String>? ingredients;

  RecipeApiModel({
    this.image,
    this.url,
    this.source,
    this.label,
    this.ingredients,
  });

  factory RecipeApiModel.fromJson(Map<String, dynamic> json) => RecipeApiModel(
    image: json["image"],
    url: json["url"],
    source: json["source"],
    label: json["label"],
    ingredients: json["ingredients"] != null
        ? List<String>.from(json["ingredients"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "url": url,
    "source": source,
    "label": label,
    "ingredients": ingredients,
  };
}


class Ingredient {
  final String? text;
  final double? quantity;
  final String? measure;
  final String? food;
  final double? weight;
  final String? foodCategory;
  final String? foodId;
  final String? image;

  Ingredient({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodCategory,
    this.foodId,
    this.image,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
    text: json["text"],
    quantity: json["quantity"]?.toDouble(),
    measure: json["measure"],
    food: json["food"],
    weight: json["weight"]?.toDouble(),
    foodCategory: json["foodCategory"],
    foodId: json["foodId"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "quantity": quantity,
    "measure": measure,
    "food": food,
    "weight": weight,
    "foodCategory": foodCategory,
    "foodId": foodId,
    "image": image,
  };

  // factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
  //   text: json["text"],
  //   quantity: json["quantity"]?.toDouble(),
  //   measure: json["measure"],
  //   food: json["food"],
  //   weight: json["weight"]?.toDouble(),
  //   foodCategory: json["foodCategory"],
  //   foodId: json["foodId"],
  //   image: json["image"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "text": text,
  //   "quantity": quantity,
  //   "measure": measure,
  //   "food": food,
  //   "weight": weight,
  //   "foodCategory": foodCategory,
  //   "foodId": foodId,
  //   "image": image,
  // };
}

//----------------



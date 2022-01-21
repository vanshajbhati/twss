class ResponseFetchMeal {
  int errorCode;
  String reponseString;
  List<Data> data;

  ResponseFetchMeal({this.errorCode, this.reponseString, this.data});

  ResponseFetchMeal.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    reponseString = json['reponse_string'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    data['reponse_string'] = this.reponseString;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  Meal meal;
  List<Foods> foods;
  Sum sum;

  Data({this.meal, this.foods,this.sum});

  Data.fromJson(Map<String, dynamic> json) {
    meal = json['meal'] != null ? new Meal.fromJson(json['meal']) : null;
    if (json['foods'] != null) {
      foods = new List<Foods>();
      json['foods'].forEach((v) {
        foods.add(new Foods.fromJson(v));
      });
    }
    sum = json['sum'] != null ? new Sum.fromJson(json['sum']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meal != null) {
      data['meal'] = this.meal.toJson();
    }
    if (this.foods != null) {
      data['foods'] = this.foods.map((v) => v.toJson()).toList();
    }
    if (this.sum != null) {
      data['sum'] = this.sum.toJson();
    }
    return data;
  }
}

class Meal {
  String id;
  String dietId;
  String name;
  String note;
  String mealTime;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Meal(
      {this.id,
        this.dietId,
        this.name,
        this.note,
        this.mealTime,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dietId = json['diet_id'];
    name = json['name'];
    note = json['note'];
    mealTime = json['meal_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['diet_id'] = this.dietId;
    data['name'] = this.name;
    data['note'] = this.note;
    data['meal_time'] = this.mealTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Foods {
  String id;
  String name;
  String protein;
  String carbs;
  String fats;
  String createdAt;
  String deletedAt;
  bool isTaken;
  String created_by;

  Foods(
      {this.id,
        this.name,
        this.protein,
        this.carbs,
        this.fats,
        this.createdAt,
        this.deletedAt,
        this.isTaken,
        this.created_by,
      });

  Foods.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    protein = json['protein'];
    carbs = json['carbs'];
    fats = json['fats'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
    isTaken = json['isTaken'];
    created_by = json['created_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['protein'] = this.protein;
    data['carbs'] = this.carbs;
    data['fats'] = this.fats;
    data['created_at'] = this.createdAt;
    data['deleted_at'] = this.deletedAt;
    data['isTaken'] = this.isTaken;
    data['created_by'] = this.created_by;
    return data;
  }
}

class Sum {
  String protein;
  String carbs;
  String fats;

  Sum({this.protein, this.carbs, this.fats});

  Sum.fromJson(Map<String, dynamic> json) {
    protein = json['protein'];
    carbs = json['carbs'];
    fats = json['fats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['protein'] = this.protein;
    data['carbs'] = this.carbs;
    data['fats'] = this.fats;
    return data;
  }}
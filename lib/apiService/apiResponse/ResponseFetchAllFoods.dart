class ResponseFetchAllFoods {
  int errorCode;
  String reponseString;
  List<Data> data;

  ResponseFetchAllFoods({this.errorCode, this.reponseString, this.data});

  ResponseFetchAllFoods.fromJson(Map<String, dynamic> json) {
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
  String id;
  String name;
  String protein;
  String carbs;
  String fats;
  String createdAt;
  Null deletedAt;

  Data(
      {this.id,
        this.name,
        this.protein,
        this.carbs,
        this.fats,
        this.createdAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    protein = json['protein'];
    carbs = json['carbs'];
    fats = json['fats'];
    createdAt = json['created_at'];
    deletedAt = json['deleted_at'];
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
    return data;
  }
}
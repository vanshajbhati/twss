class ResponseFetchExerciseByUserId {
  int errorCode;
  String reponseString;
  List<Data> data;

  ResponseFetchExerciseByUserId(
      {this.errorCode, this.reponseString, this.data});

  ResponseFetchExerciseByUserId.fromJson(Map<String, dynamic> json) {
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
  String workoutId;
  String workoutCategoryId;
  String userId;
  String name;
  String video;
  String image;
  String description;
  String youTubeLink;
  String selectedUnit;
  String createdAt;
  String updatedAt;
  String deletedAt;
  bool isSelected = false;

  Data(
      {this.id,
        this.workoutId,
        this.workoutCategoryId,
        this.userId,
        this.name,
        this.video,
        this.image,
        this.description,
        this.youTubeLink,
        this.selectedUnit,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
      this.isSelected});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workoutId = json['workout_id'];
    workoutCategoryId = json['workout_category_id'];
    userId = json['user_id'];
    name = json['name'];
    video = json['video'];
    image = json['image'];
    description = json['description'];
    youTubeLink = json['you_tube_link'];
    selectedUnit = json['selected_unit'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    isSelected = isSelected;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['workout_id'] = this.workoutId;
    data['workout_category_id'] = this.workoutCategoryId;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['video'] = this.video;
    data['image'] = this.image;
    data['description'] = this.description;
    data['you_tube_link'] = this.youTubeLink;
    data['selected_unit'] = this.selectedUnit;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
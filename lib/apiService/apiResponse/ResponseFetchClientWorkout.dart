class ResponseFetchClientWorkout {
  int errorCode;
  String reponseString;
  List<Data> data;

  ResponseFetchClientWorkout({this.errorCode, this.reponseString, this.data});

  ResponseFetchClientWorkout.fromJson(Map<String, dynamic> json) {
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
  String userId;
  String trainerId;
  String fromDate;
  String toDate;
  String title;
  String createdAt;
  String updatedAt;
  String deletedAt;

  Data(
      {this.id,
        this.userId,
        this.trainerId,
        this.fromDate,
        this.toDate,
        this.title,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    trainerId = json['trainer_id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    title = json['title'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['trainer_id'] = this.trainerId;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['title'] = this.title;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
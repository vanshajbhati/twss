class ResponseFetchMembership {
  int errorCode;
  String reponseString;
  List<DataMembership> data;

  ResponseFetchMembership({this.errorCode, this.reponseString, this.data});

  ResponseFetchMembership.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    reponseString = json['reponse_string'];
    if (json['data'] != null) {
      data = new List<DataMembership>();
      json['data'].forEach((v) {
        data.add(new DataMembership.fromJson(v));
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

class DataMembership {
  String id;
  String userId;
  String plan;
  String name;
  String price;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  DataMembership(
      {this.id,
        this.userId,
        this.plan,
        this.name,
        this.price,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  DataMembership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    plan = json['plan'];
    name = json['name'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['plan'] = this.plan;
    data['name'] = this.name;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
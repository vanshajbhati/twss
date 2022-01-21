class ResponseFetchMembers {
  int errorCode;
  List<DataMembers> data;
  String reponseString;

  ResponseFetchMembers({this.errorCode, this.data, this.reponseString});

  ResponseFetchMembers.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    if (json['data'] != null) {
      data = new List<DataMembers>();
      json['data'].forEach((v) {
        data.add(new DataMembers.fromJson(v));
      });
    }
    reponseString = json['reponse_string'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_code'] = this.errorCode;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['reponse_string'] = this.reponseString;
    return data;
  }
}

class DataMembers {
  String id;
  String userId;
  String name;
  String experience;
  String designation;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  DataMembers(
      {this.id,
        this.userId,
        this.name,
        this.experience,
        this.designation,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  DataMembers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    experience = json['experience'];
    designation = json['designation'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['experience'] = this.experience;
    data['designation'] = this.designation;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
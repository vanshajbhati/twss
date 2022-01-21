class ResponseFetchBlog {
  int errorCode;
  String reponseString;
  List<DataFetchBlog> data;

  ResponseFetchBlog({this.errorCode, this.reponseString, this.data});

  ResponseFetchBlog.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    reponseString = json['reponse_string'];
    if (json['data'] != null) {
      data = new List<DataFetchBlog>();
      json['data'].forEach((v) {
        data.add(new DataFetchBlog.fromJson(v));
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

class DataFetchBlog {
  String id;
  String userId;
  String title;
  String description;
  String image;
  String video;
  String createdAt;
  String updatedAt;
  String deletedAt;

  DataFetchBlog(
      {this.id,
        this.userId,
        this.title,
        this.description,
        this.image,
        this.video,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  DataFetchBlog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
class ResponseFetchUnits {
  int errorCode;
  String reponseString;
  List<DataVideo> data;

  ResponseFetchUnits({this.errorCode, this.reponseString, this.data});

  ResponseFetchUnits.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    reponseString = json['reponse_string'];
    if (json['data'] != null) {
      data = new List<DataVideo>();
      json['data'].forEach((v) {
        data.add(new DataVideo.fromJson(v));
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

class DataVideo {
  String id;
  String name;

  DataVideo({this.id, this.name});

  DataVideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
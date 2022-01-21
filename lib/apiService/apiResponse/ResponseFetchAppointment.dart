class ResponseFetchAppointment {
  int errorCode;
  String reponseString;
  List<DataFetchAppointment> data;

  ResponseFetchAppointment({this.errorCode, this.reponseString, this.data});

  ResponseFetchAppointment.fromJson(Map<String, dynamic> json) {
    errorCode = json['error_code'];
    reponseString = json['reponse_string'];
    if (json['data'] != null) {
      data = new List<DataFetchAppointment>();
      json['data'].forEach((v) {
        data.add(new DataFetchAppointment.fromJson(v));
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

class DataFetchAppointment {
  String id;
  String userId;
  String meetingType;
  String appointmentDate;
  String startTime;
  String endTime;
  String selectedUser;
  String description;
  String meetLink;
  String createdAt;
  String updatedAt;
  String deletedAt;

  DataFetchAppointment(
      {this.id,
        this.userId,
        this.meetingType,
        this.appointmentDate,
        this.startTime,
        this.endTime,
        this.selectedUser,
        this.description,
        this.meetLink,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  DataFetchAppointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    meetingType = json['meeting_type'];
    appointmentDate = json['appointment_date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    selectedUser = json['selected_user'];
    description = json['description'];
    meetLink = json['meet_link'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['meeting_type'] = this.meetingType;
    data['appointment_date'] = this.appointmentDate;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['selected_user'] = this.selectedUser;
    data['description'] = this.description;
    data['meet_link'] = this.meetLink;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
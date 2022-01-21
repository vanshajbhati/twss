class ResponseFetchWorkoutDetails {
  int errorCode;
  String reponseString;
  List<Data> data;

  ResponseFetchWorkoutDetails({this.errorCode, this.reponseString, this.data});

  ResponseFetchWorkoutDetails.fromJson(Map<String, dynamic> json) {
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
  Exercise exercise;
  List<Sets> sets;

  Data({this.exercise, this.sets});

  Data.fromJson(Map<String, dynamic> json) {
    exercise = json['exercise'] != null
        ? new Exercise.fromJson(json['exercise'])
        : null;
    if (json['sets'] != null) {
      sets = new List<Sets>();
      json['sets'].forEach((v) {
        sets.add(new Sets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.exercise != null) {
      data['exercise'] = this.exercise.toJson();
    }
    if (this.sets != null) {
      data['sets'] = this.sets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Exercise {
  String id;
  String linkedId;
  String trainerWorkoutId;
  String exerciseId;
  String exerciseName;
  String inbetweenInterval;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Exercise(
      {this.id,
        this.linkedId,
        this.trainerWorkoutId,
        this.exerciseId,
        this.exerciseName,
        this.inbetweenInterval,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Exercise.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    linkedId = json['linked_id'];
    trainerWorkoutId = json['trainer_workout_id'];
    exerciseId = json['exercise_id'];
    exerciseName = json['exercise_name'];
    inbetweenInterval = json['inbetween_interval'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['linked_id'] = this.linkedId;
    data['trainer_workout_id'] = this.trainerWorkoutId;
    data['exercise_id'] = this.exerciseId;
    data['exercise_name'] = this.exerciseName;
    data['inbetween_interval'] = this.inbetweenInterval;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Sets {
  String id;
  String trainerWorkoutExerciseId;
  String setType;
  String kg;
  String reps;
  String km;
  String time;
  String level;
  String breath;
  String inbetweenInterval;
  String createdAt;
  String updatedAt;
  Null deletedAt;

  Sets(
      {this.id,
        this.trainerWorkoutExerciseId,
        this.setType,
        this.kg,
        this.reps,
        this.km,
        this.time,
        this.level,
        this.breath,
        this.inbetweenInterval,
        this.createdAt,
        this.updatedAt,
        this.deletedAt});

  Sets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    trainerWorkoutExerciseId = json['trainer_workout_exercise_id'];
    setType = json['set_type'];
    kg = json['kg'];
    reps = json['reps'];
    km = json['km'];
    time = json['time'];
    level = json['level'];
    breath = json['breath'];
    inbetweenInterval = json['inbetween_interval'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trainer_workout_exercise_id'] = this.trainerWorkoutExerciseId;
    data['set_type'] = this.setType;
    data['kg'] = this.kg;
    data['reps'] = this.reps;
    data['km'] = this.km;
    data['time'] = this.time;
    data['level'] = this.level;
    data['breath'] = this.breath;
    data['inbetween_interval'] = this.inbetweenInterval;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
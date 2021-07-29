class ActivityModel {
  List<ActivityCaring> activityCaring;
  List<ActivityWeathering> activityWeathering;
  List<ActivityProtection> activityProtection;
  List<ActivitySpecial> activitySpecial;

  ActivityModel(
      {this.activityCaring,
      this.activityWeathering,
      this.activityProtection,
      this.activitySpecial});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    if (json['activity_caring'] != null) {
      activityCaring = <ActivityCaring>[];
      json['activity_caring'].forEach((v) {
        activityCaring.add(new ActivityCaring.fromJson(v));
      });
    }
    if (json['activity_weathering'] != null) {
      activityWeathering = new List<ActivityWeathering>();
      json['activity_weathering'].forEach((v) {
        activityWeathering.add(new ActivityWeathering.fromJson(v));
      });
    }
    if (json['activity_protection'] != null) {
      activityProtection = new List<ActivityProtection>();
      json['activity_protection'].forEach((v) {
        activityProtection.add(new ActivityProtection.fromJson(v));
      });
    }
    if (json['activity_special'] != null) {
      activitySpecial = new List<ActivitySpecial>();
      json['activity_special'].forEach((v) {
        activitySpecial.add(new ActivitySpecial.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.activityCaring != null) {
      data['activity_caring'] =
          this.activityCaring.map((v) => v.toJson()).toList();
    }
    if (this.activityWeathering != null) {
      data['activity_weathering'] =
          this.activityWeathering.map((v) => v.toJson()).toList();
    }
    if (this.activityProtection != null) {
      data['activity_protection'] =
          this.activityProtection.map((v) => v.toJson()).toList();
    }
    if (this.activitySpecial != null) {
      data['activity_special'] =
          this.activitySpecial.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActivitySpecial {
  String name;
  String thName;

  ActivitySpecial({this.name, this.thName});

  ActivitySpecial.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thName = json['th_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['th_name'] = this.thName;
    return data;
  }
}

class ActivityProtection {
  String name;
  String thName;

  ActivityProtection({this.name, this.thName});

  ActivityProtection.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thName = json['th_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['th_name'] = this.thName;
    return data;
  }
}

class ActivityWeathering {
  String name;
  String thName;

  ActivityWeathering({this.name, this.thName});

  ActivityWeathering.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thName = json['th_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['th_name'] = this.thName;
    return data;
  }
}

class ActivityCaring {
  String name;
  String thName;

  ActivityCaring({this.name, this.thName});

  ActivityCaring.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    thName = json['th_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['th_name'] = this.thName;
    return data;
  }
}

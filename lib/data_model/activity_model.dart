import 'dart:convert';

import 'package:flutter/services.dart';

class ActivityModel {
  final int activityId;
  final String activityName;
  final String activityTH;

  ActivityModel(this.activityId, this.activityName, this.activityTH);

  Future<void> readJsonLocal() async {
    final String response = await rootBundle.loadString('');
    final data = await json.decode(response);
  }
}

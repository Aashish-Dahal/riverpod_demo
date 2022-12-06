import 'dart:convert';

class Activity {
  String? activity;
  String? type;
  num? price;
  Activity({
    this.activity,
    this.type,
    this.price,
  });

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      activity: map['activity'],
      type: map['type'],
      price: map['price'],
    );
  }

  factory Activity.fromJson(String source) =>
      Activity.fromMap(json.decode(source));

  @override
  String toString() =>
      'Activity(activity: $activity, type: $type, price: $price)';
}

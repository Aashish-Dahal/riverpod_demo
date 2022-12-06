import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/activity.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<Activity> getActivity() async {
    try {
      final res = await Dio().get("https://www.boredapi.com/api/activity");
      return Activity.fromMap(res.data);
    } catch (e) {
      throw Exception('Error getting Activity');
    }
  }
}

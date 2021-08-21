import 'dart:convert';

import 'package:color_logger/color_logger.dart';
import 'package:dio/dio.dart';
import 'package:users/models/usersModels.dart';

const url = 'https://jsonplaceholder.typicode.com';

Future<List<User>> getUsers() async {
  try {
    var response = await Dio().get('${url}/users');

    final parsed = (response.data is String
        ? json.decode(response.data)
        : response.data) as List<dynamic>;

    List<User> users = parsed.map((e) => User.fromJson(e)).toList();
    return users;
  } catch (e) {
    print(e);
  }
  return <User>[];
}

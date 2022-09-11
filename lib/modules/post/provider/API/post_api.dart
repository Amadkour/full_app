import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/post_model.dart';

class PostAPI {
  Future<List<PostModel>> getPosts() async {
    Dio d = Dio();

    Response s = await d.get(
      'https://jsonplaceholder.typicode.com/posts',
    );

    return s.data
        .map((json) => PostModel.fromJson(json))
        .toList()
        .cast<PostModel>();
  }

  Future<void> insertPosts(
      {required String title, required String body}) async {
    Dio d = Dio();
    Response s = await d.post('https://jsonplaceholder.typicode.com/posts',
        data: json.encode({
          'title': title,
          'body': body,
          'userId': 1,
        }));
    print(s.data);
  }

  void updatePosts(
      {required String title, required String body, required int id}) async {
    Dio d = Dio();
    Response s = await d.put('https://jsonplaceholder.typicode.com/posts/$id',
        data: json.encode({
          'title': title,
          'body': body,
          'userId': 1,
        }));
    print(s.data);
  }

  void deletePost({required int id}) async {
    Dio d = Dio();
    Response s =
        await d.delete('https://jsonplaceholder.typicode.com/posts/$id');
    print(s.data);
  }
}

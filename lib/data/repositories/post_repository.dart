import 'package:dio/dio.dart';
import 'package:mfajriansyah_flutter_test/data/models/post_model.dart';

class PostRepository {
  static final Dio _dio = Dio();
  final _url = 'https://jsonplaceholder.typicode.com/posts';
  
  Future<List<PostModel>> getPost() async {
    try {
      final response = await _dio.get(_url);
      if (response.statusCode == 200) {
        final json = response.data as List;
        final posts = json.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<PostModel?> getById(int id) async {
    try {
      final response = await _dio.get('$_url/$id');
      if (response.statusCode == 200) {
        return PostModel(
          userId: response.data['userId'], 
          id: response.data['id'], 
          title: response.data['title'], 
          body: response.data['body']
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return null;
  }

  Future<List<PostModel>> filterByTitle(String title) async {
    try {
      final response = await _dio.get(_url);
      if (response.statusCode == 200) {
        final json = response.data as List;
        final posts = json.map((e) => PostModel.fromJson(e)).where((post) {
          final titleLower = post.title.toLowerCase();
          final searchLower = title.toLowerCase();
          return titleLower.contains(searchLower);
        }).toList();
        print(posts);
        return posts;
      } else {
        throw Exception('Failed');
      }
    } catch (e) {
      rethrow;
    }
  }
}
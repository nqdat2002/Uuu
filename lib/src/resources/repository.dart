import 'package:uuu/src/models/newsResponseModel.dart';
import 'newsApiProvider.dart';

class Repository {
  final moviesApiProvider = NewsApiProvider();
  Future<List<Article>> fetchAllNews({String category = ''}) => moviesApiProvider.fetchNewsList(category:category);
}
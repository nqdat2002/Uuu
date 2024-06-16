import 'package:uuu/src/helpers/constants.dart';
import 'package:uuu/src/models/newsResponseModel.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class NewsApiProvider {
  Client client = Client();
  final _apiKey = Constant.newsApiKey;

  Future<List<Article>> fetchNewsList({String category = ''}) async {
    var url =
        "${Constant.baseUrl}${Constant.topHeadLine}?country=in&apiKey=$_apiKey&category=$category";
    print("entered Url : $url");
    final response = await client.get(Uri.parse(url));
    // print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return NewsApiResponse.fromRawJson(response.body).articles;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<void> saveNewsToCsv({String category = ''}) async {
    List<Article> articles = await fetchNewsList(category: category);
    String csv = listToCsv(articles);
    await saveCsvToFile(csv);
  }

  String listToCsv(List<Article> articles) {
    List<List<String>> rows = [];
    rows.add(['Title', 'Description', 'URL']); // Header row

    for (Article article in articles) {
      List<String> row = [];
      row.add(article.title??'');
      row.add(article.description??'');
      row.add(article.url??'');
      rows.add(row);
    }

    return const ListToCsvConverter().convert(rows);
  }

  Future<void> saveCsvToFile(String csv) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/newsAPI.csv';
    final file = File(path);
    await file.writeAsString(csv);
  }
}
class ListToCsvConverter {
  const ListToCsvConverter();

  String convert(List<List<String>> data) {
    return data.map((row) => row.map((e) => '"$e"').join(',')).join('\n');
  }
}
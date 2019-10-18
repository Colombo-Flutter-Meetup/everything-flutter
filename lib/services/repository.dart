import 'package:everything_flutter/model/news.dart';
import 'package:everything_flutter/services/network.dart';

class Repository {
  NetworkService networkService = new NetworkService();

  Future<List<News>> fetchAllNews() => networkService.getAllNews();
}

//https://everythingflutter.iconicto.com/api/communities
//https://everythingflutter.iconicto.com/api/widgets
//https://everythingflutter.iconicto.com/api/tutorials
//https://everythingflutter.iconicto.com/api/events
//https://everythingflutter.iconicto.com/api/news

import 'package:dio/dio.dart';
import 'package:everything_flutter/model/Widget.dart';
import 'package:everything_flutter/model/community.dart';
import 'package:everything_flutter/model/event.dart';
import 'package:everything_flutter/model/news.dart';
import 'package:everything_flutter/model/tutorial.dart';

abstract class Api {
  Future<List<News>> getAllNews();

  List<Community> getAllCommunities();

  List<Event> getAllEvents();

  List<Tutorial> getAllTutorials();

  List<Widget> getAllWidgets();
}

class NetworkService extends Api {
  @override
  List<Community> getAllCommunities() {
    // TODO: implement getAllCommunities
    return null;
  }

  @override
  List<Event> getAllEvents() {
    // TODO: implement getAllEvents
    return null;
  }

  @override
  Future<List<News>> getAllNews() async {
    final String _endpoint =
        "https://everythingflutter.iconicto.com/api/ui.widgets/";
    final Dio _dio = Dio();

    Response response = await _dio.get(_endpoint);

    return NewsList.fromMap(response.data).data;
  }

  @override
  List<Tutorial> getAllTutorials() {
    // TODO: implement getAllTutorials
    return null;
  }

  @override
  List<Widget> getAllWidgets() {
    final String _endpoint =
        "https://everythingflutter.iconicto.com/api/ui.widgets/";
    final Dio _dio = Dio();

//		Response response = await _dio.get(_endpoint);

//		return NewsList.fromMap(response.data).data;

//	  _stateController.add(BusyHomeState());
//	  try {
//		  Response response = await _dio.get(_endpoint);
//		  print(response.data);
//		  newsList = NewsList.fromMap(response.data).data;
//		  _stateController.add(DataFetchedHomeState(data: newsList));
//	  } catch (error, stacktrace) {
//		  print("Exception occured: $error stackTrace: $stacktrace");
//		  return _stateController.addError(error);
//	  }
    return null;
  }
}

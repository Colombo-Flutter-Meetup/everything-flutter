import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everything_flutter/model/news.dart';
import 'package:everything_flutter/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _repository = Repository();

  @override
  HomeState get initialState => InitialHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is FetchNewsData) {
      yield* _mapFetchNewsDataToState();
    }
  }

  Stream<HomeState> _mapFetchNewsDataToState() async* {
    yield NetworkBusyHomeState();
    try {
      // network call
      List<News> newsList = await _repository.fetchAllNews();

      yield NewsFetchedHomeState(newsList: newsList);
    } catch (error, stacktrace) {
      // handle network call error
      print(stacktrace);
      yield NetworkErrorHomeState(error: error.toString());
    }
  }
}

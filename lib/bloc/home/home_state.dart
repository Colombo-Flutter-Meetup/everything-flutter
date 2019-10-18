part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class InitialHomeState extends HomeState {
  @override
  String toString() => 'InitialHomeState';
}

class NetworkBusyHomeState extends HomeState {
  @override
  String toString() => 'NetworkBusyHomeState';
}

class NetworkErrorHomeState extends HomeState {
  final String error;

  NetworkErrorHomeState({this.error});

  @override
  String toString() => 'NetworkErrorHomeState';
}

class NewsFetchedHomeState extends HomeState {
  final List<News> newsList;

  NewsFetchedHomeState({this.newsList = const []}) : super([newsList]);

  bool get hasData => newsList.length > 0;

  @override
  String toString() => 'NewsFetchedHomeState';
}

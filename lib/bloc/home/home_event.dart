part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class FetchNewsData extends HomeEvent {}

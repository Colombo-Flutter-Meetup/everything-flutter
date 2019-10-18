part of 'tutorial_bloc.dart';

@immutable
abstract class TutorialState extends Equatable {
  TutorialState([List props = const []]) : super(props);
}

class InitialTutorialState extends TutorialState {
  @override
  String toString() => 'InitialTutorialState';
}

class NetworkBusyTutorialState extends TutorialState {
  @override
  String toString() => 'NetworkBusyTutorialState';
}

class NetworkErrorTutorialState extends TutorialState {
  final String error;

  NetworkErrorTutorialState({this.error});

  @override
  String toString() => 'NetworkErrorTutorialState';
}

class TutorialsFetchTutorialState extends TutorialState {
  final List<Tutorial> tutorialList;

  TutorialsFetchTutorialState({this.tutorialList = const []})
      : super([tutorialList]);

  bool get hasData => tutorialList.length > 0;

  @override
  String toString() => 'TutorialsFetchTutorialState';
}

part of 'tutorial_bloc.dart';

@immutable
abstract class TutorialEvent extends Equatable {
  TutorialEvent([List props = const []]) : super(props);
}

class FetchTutorialsData extends TutorialEvent {}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:everything_flutter/model/tutorial.dart';
import 'package:meta/meta.dart';

part 'tutorial_event.dart';
part 'tutorial_state.dart';

class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  @override
  TutorialState get initialState => InitialTutorialState();

  @override
  Stream<TutorialState> mapEventToState(TutorialEvent event) async* {
    // TODO: Add your event logic
  }
}

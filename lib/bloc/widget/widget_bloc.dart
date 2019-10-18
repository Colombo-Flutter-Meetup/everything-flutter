import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'widget_event.dart';
part 'widget_state.dart';

class WidgetBloc extends Bloc<WidgetEvent, WidgetState> {
  @override
  WidgetState get initialState => InitialWidgetState();

  @override
  Stream<WidgetState> mapEventToState(WidgetEvent event) async* {
    // TODO: Add your event logic
  }
}

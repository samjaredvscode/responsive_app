import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_bloc.freezed.dart';
part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(Initial(index: 0)) {
    on<TabEvent>((event, emit) {
      event.when(
        currentIndex: (currentIndex) =>
            emit(TabState.initial(index: currentIndex)),
      );
    });
  }
}

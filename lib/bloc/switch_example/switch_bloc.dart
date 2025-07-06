import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_event.dart';
part 'switch_state.dart';

class SwitchBloc extends Bloc<SwitchEvents, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_changeSwitch);
    on<SliderEvent>(_changeSlider);
  }

  void _changeSwitch(SwitchEvents event, Emitter<SwitchState> emit) {
    emit(state.copyWith(switchValue: !state.switchValue));
  }

  void _changeSlider(SliderEvent event, Emitter<SwitchState> emit) {
    emit(state.copyWith(sliderValue: event.sliderValue));
  }
}

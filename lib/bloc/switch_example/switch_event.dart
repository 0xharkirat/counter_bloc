part of 'switch_bloc.dart';

abstract class SwitchEvents extends Equatable {
  const SwitchEvents();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvents {}

class SliderEvent extends SwitchEvents {
  final double sliderValue;
  const SliderEvent(this.sliderValue);

  @override
  List<Object> get props => [sliderValue];


}

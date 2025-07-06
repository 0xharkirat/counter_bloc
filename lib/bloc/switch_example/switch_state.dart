part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchValue;
  final double sliderValue;
  const SwitchState({this.switchValue = false, this.sliderValue = 0.2});

  SwitchState copyWith({bool? switchValue, double? sliderValue}) {
    return SwitchState(
      switchValue: switchValue ?? this.switchValue,
      sliderValue: sliderValue ?? this.sliderValue,
    );
  }

  @override
  List<Object> get props => [switchValue, sliderValue];
}

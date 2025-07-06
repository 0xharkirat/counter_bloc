import 'package:counter_bloc/bloc/switch_example/switch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatelessWidget {
  const SwitchExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Example Two")),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Notifications"),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state) {
                      return Switch(
                        value: state.switchValue,
                        onChanged: (newValue) {
                          context.read<SwitchBloc>().add(
                            EnableOrDisableNotification(),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Container(height: 200, color: Colors.red.withOpacity(state.sliderValue));
                },
              ),
              BlocBuilder<SwitchBloc, SwitchState>(
                builder: (context, state) {
                  return Slider.adaptive(
                    value: state.sliderValue,
                    onChanged: (value) {
                      context.read<SwitchBloc>().add(SliderEvent(value));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

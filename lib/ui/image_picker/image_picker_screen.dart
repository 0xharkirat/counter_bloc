import 'dart:io';

import 'package:counter_bloc/bloc/image_picker/image_picker_bloc.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_events.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Image Picker")),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return state.file == null
                ? IconButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(FromGalleryEvent());
                  },
                  icon: Icon(Icons.camera),
                )
                : Image.file(File(state.file!.path.toString()));
          },
        ),
      ),
    );
  }
}

import 'package:counter_bloc/bloc/image_picker/image_picker_events.dart';
import 'package:counter_bloc/bloc/image_picker/image_picker_state.dart';
import 'package:counter_bloc/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvents, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<FromCameraEvent>(_fromCameraCapture);
    on<FromGalleryEvent>(_fromGallery);
  }

  Future<void> _fromCameraCapture(
    FromCameraEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  Future<void> _fromGallery(
    FromGalleryEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final file = await imagePickerUtils.galleryImage();
    emit(state.copyWith(file: file));
  }


}

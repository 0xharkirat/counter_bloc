import 'package:equatable/equatable.dart';

abstract class ImagePickerEvents extends Equatable {
  const ImagePickerEvents();
  @override
  List<Object?> get props => [];
}

class FromCameraEvent extends ImagePickerEvents {}

class FromGalleryEvent extends ImagePickerEvents {}

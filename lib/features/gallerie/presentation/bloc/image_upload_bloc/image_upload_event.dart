part of 'image_upload_bloc.dart';

abstract class ImageUploadEvent extends Equatable {
  const ImageUploadEvent();

  @override
  List<Object> get props => [];
}

class UploadImageEvent extends ImageUploadEvent {
  final File imageFile;

  UploadImageEvent({required this.imageFile});
}

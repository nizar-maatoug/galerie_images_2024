part of 'image_upload_bloc.dart';

sealed class ImageUploadState extends Equatable {
  const ImageUploadState();

  @override
  List<Object> get props => [];
}

final class ImageUploadInitial extends ImageUploadState {}

class ImageUploadProgressState extends ImageUploadState {}

class ImageUploadedState extends ImageUploadState {}

class ImageUploadErrorState extends ImageUploadState {
  final String message;
  ImageUploadErrorState({required this.message});
}

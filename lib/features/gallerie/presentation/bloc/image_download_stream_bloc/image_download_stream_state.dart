part of 'image_download_stream_bloc.dart';

sealed class ImageDownloadStreamState extends Equatable {
  const ImageDownloadStreamState();
  
  @override
  List<Object> get props => [];
}

final class ImageDownloadStreamInitial extends ImageDownloadStreamState {}

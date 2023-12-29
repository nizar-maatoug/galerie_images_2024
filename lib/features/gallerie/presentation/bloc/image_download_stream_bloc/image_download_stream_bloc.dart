import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_download_stream_event.dart';
part 'image_download_stream_state.dart';

class ImageDownloadStreamBloc extends Bloc<ImageDownloadStreamEvent, ImageDownloadStreamState> {
  ImageDownloadStreamBloc() : super(ImageDownloadStreamInitial()) {
    on<ImageDownloadStreamEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

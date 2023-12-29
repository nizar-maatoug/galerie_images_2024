import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'image_upload_event.dart';
part 'image_upload_state.dart';

class ImageUploadBloc extends Bloc<ImageUploadEvent, ImageUploadState> {
  ImageUploadBloc() : super(ImageUploadInitial()) {
    on<ImageUploadEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}

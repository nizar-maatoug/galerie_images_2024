import 'dart:io';

import 'package:equatable/equatable.dart';

class ImagePublicationEntity extends Equatable {
  final File? imageFile;

  final String? imageURL;

  final String? userUID;

  ImagePublicationEntity(
      {required this.imageFile, required this.imageURL, required this.userUID});

  @override
  List<Object?> get props => ['userId', 'imageURL'];
}

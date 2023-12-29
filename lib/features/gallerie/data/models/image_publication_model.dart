import 'dart:io';

import 'package:galerie_image_2024/features/gallerie/domain/entities/image_publication_entity.dart';

class ImagePublicationModel extends ImagePublicationEntity {
  ImagePublicationModel({
    required File imageFile,
    String? imageURL,
    String? userUID,
  }) : super(imageFile: imageFile, imageURL: imageURL, userUID: userUID);
}

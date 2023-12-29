

import 'package:dartz/dartz.dart';
import 'package:galerie_image_2024/core/failures/failures.dart';
import 'package:galerie_image_2024/features/gallerie/domain/entities/image_publication_entity.dart';

abstract class ImageUploadRepository{
  Future<Either<Failure, Unit>> uploadImage(ImagePublicationEntity imagePublicationEntity);
}
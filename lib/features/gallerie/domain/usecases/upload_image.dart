import 'package:dartz/dartz.dart';
import 'package:galerie_image_2024/core/failures/failures.dart';
import 'package:galerie_image_2024/features/gallerie/domain/entities/image_publication_entity.dart';
import 'package:galerie_image_2024/features/gallerie/domain/repositories/Image_upload_repository.dart';

class UploadImageUseCase {
  
  final ImageUploadRepository imageUploadRepository;

  UploadImageUseCase({required this.imageUploadRepository});

  Future<Either<Failure, Unit>> call(ImagePublicationEntity imagePub) async {
    return await imageUploadRepository.uploadImage(imagePub);
  }


}

import 'package:dartz/dartz.dart';
import 'package:galerie_image_2024/core/failures/failures.dart';
import 'package:galerie_image_2024/features/auth/domain/entities/user_entity.dart';
import 'package:galerie_image_2024/features/auth/domain/repositories/user_repository.dart';



class SignInUserUseCase {
  final UserRepository userRepository;

  SignInUserUseCase(this.userRepository);

  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await userRepository.signIn(user);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:galerie_image_2024/core/firebase/firebase_service.dart';
import 'package:galerie_image_2024/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../../../injection_container.dart' as di;

class GallerieImagePage extends StatelessWidget {
  const GallerieImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galerie images"),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
                //Navigate.......
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Container(
        child: const Text('Galerie image page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.photo_camera),
        onPressed: _takePhoto,
      ),
    );
  }

  void _takePhoto() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );
    
    if (pickedImage == null) {
      return;
    }
    
    //Upload image to firebase storage
    
    File _imageFile = File(pickedImage.path);

    //await di.init();
    //Mauvaise implémentation: il faut le faire dans la couche dataSource
    final storage =
        await di.sl<FirebaseService>().getStorage().ref().child('images');

    //figer glacer le screen (il faut éviter)
    await storage.putFile(_imageFile);
 
    final imageURL = storage.getDownloadURL();
    print(imageURL);
  }
}

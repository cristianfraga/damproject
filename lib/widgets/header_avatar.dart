import 'dart:io';

import 'package:damproject/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class HeaderAvatar extends StatelessWidget {

  String? imagePath;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: white.withOpacity(0.2),
            radius: 75,
            backgroundImage: (imagePath != null) ? FileImage(File(imagePath!)) : null, // Agregar esta línea
            child: (imagePath == null) ? const Icon(Icons.person, color: white, size: 150) : null, // Modificar esta línea
          ),
          Positioned(
            right: 120,
            top: 110,
            child: InkWell(
              onTap: () {
                _onCameraButtonPressed(context);
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.transparent,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.camera_alt),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _onCameraButtonPressed(BuildContext context) async {
  final PermissionStatus status = await Permission.camera.request();
  if (status.isGranted) {
    final XFile? pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath = '${directory.path}/avatar.jpg';

      final compressedImage = await FlutterImageCompress.compressAndGetFile(
        pickedFile.path,
        imagePath,
        quality: 85,
      );

      if (compressedImage != null) {
        _handleCompressedImage(context, compressedImage as File);
      }
    }
  } else {
    showCameraPermissionDialog(context);
  }
}

void _handleCompressedImage(BuildContext context, File compressedImage) {
  final imagePath = compressedImage.path;
  HeaderAvatar().imagePath = imagePath;
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Compressed Image'),
        content: Image.file(compressedImage),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              _saveImage(compressedImage);
              Navigator.of(dialogContext).pop();
            },
          ),
        ],
      );
    },
  );
}

void _saveImage(File image) async {
  final directory = await getApplicationDocumentsDirectory();
  final savedImagePath = '${directory.path}/compressed_avatar.jpg';
  await image.copy(savedImagePath);
  // TODO: What else do I want to do with the image?
}

void showCameraPermissionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext dialogContext) {
      return AlertDialog(
        title: const Text('Camera Permission'),
        content: const Text('Please grant camera permission to take a photo.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
        ],
      );
    },
  );
}
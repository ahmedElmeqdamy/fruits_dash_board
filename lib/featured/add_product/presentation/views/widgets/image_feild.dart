import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {

  final ValueChanged<File?> onFileChange;

  const ImageField({super.key, required this.onFileChange});

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            await pickImage();
          } catch (error) {
            log('error is $error');
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: fileImage != null
                    ? Image.file(fileImage!)
                    : Icon(Icons.image, size: 180),
              ),
            ),
            Positioned(
              bottom: 25,
              right: 20,
              child: Visibility(
                visible: fileImage != null,
                child: IconButton(
                  iconSize: 30,
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      fileImage = null;
                      widget.onFileChange(null);
                    });
                  },
                  icon: Icon(Icons.restore_from_trash_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {

    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
   widget.onFileChange!(fileImage!);
  }
}

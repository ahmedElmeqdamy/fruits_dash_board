import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_dash_board/core/services/storeage_services.dart';
import 'package:path/path.dart' as p;

class FireStorage implements StorageServices {
  final storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);

    var fileRef = storageRef.child('$path/$fileName.$extensionName');
    await fileRef.putFile(file);
    var fileUrl = await fileRef.getDownloadURL();
    return fileUrl;

  }
}

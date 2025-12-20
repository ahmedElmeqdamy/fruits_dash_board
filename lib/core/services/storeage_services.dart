import 'dart:io';

abstract class StorageServices {
  Future<String> uploadFile(File image, String path);
}

import 'dart:developer';
import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:fruits_dash_board/core/services/storeage_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageServices implements StorageServices {
  static late Supabase _supabase;

  static createBuckets(String bucketName) async {
    var buckets = await _supabase.client.storage.listBuckets();

    bool isBucketExits = false;

    for (var buckte in buckets) {
      if (buckte.id == bucketName) {
        isBucketExits = true;
        break;
      }
    }
    if (!isBucketExits) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static Future<void> initSupabase() async {
    _supabase = await Supabase.initialize(
      url: 'https://uvzggwacrbhrpxyxdvxo.supabase.co',
      anonKey: 'sb_secret_E6Dk0LuTw43_iZPwRLUibw_A_KIUP1S',
    );
    ;
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    //p.basename(file.path) dala deh bt2os kol haga w tseeb name file bas  ;
    //file.path dah mkan file al 3andy fi app;
    String fileName = p.basename(file.path);
    //p.extension(file.path) dala deh bt2os kol haga extension name file bas ;
    String extensionName = p.extension(file.path);
    var result = await _supabase.client.storage
        .from('fruits_images')
        .upload('$path/$fileName', file);
    final String publicUrl = _supabase.client.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName');
    log(publicUrl);
    return result;
  }
}

import 'package:fruits_dash_board/core/repos/image_repo/image_repo.dart';
import 'package:fruits_dash_board/core/repos/image_repo/image_repo_impl.dart';
import 'package:fruits_dash_board/core/services/storeage_services.dart';
import 'package:get_it/get_it.dart';

import '../repos/product_repo/product_repo.dart';
import '../repos/product_repo/product_repo_impl.dart';
import 'database_services.dart';
import 'fire_storage.dart';
import 'firestore_services.dart';


//create method setup to register all dependencies 1-2
final GetIt getIt = GetIt.instance;

void setupGetIt() {
  // Register services
  getIt.registerSingleton<StorageServices>(FireStorage());
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<ImageRepo>(ImageRepoImpl(getIt.get<StorageServices>()));
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(getIt.get<DatabaseServices>()));

  
  // Register repositories with their dependencies

}

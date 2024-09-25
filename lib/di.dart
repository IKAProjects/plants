import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:plants/src/data/plant_repository.dart';
import 'package:plants/src/domain/models/plant_model.dart';

final getIt = GetIt.instance;

Future<void> setUpDependencies() async {
  await Hive.initFlutter();
  var plantBox = await Hive.openBox<PlantModel>('plants');

  getIt.registerSingleton<Box<PlantModel>>(plantBox);
  getIt.registerLazySingleton<PlantRepository>(() => PlantRepository(plantBox));
}
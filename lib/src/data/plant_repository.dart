import 'package:hive/hive.dart';
import 'package:plants/src/domain/models/plant_model.dart';

class PlantRepository {
  final Box<PlantModel> plantBox;

  PlantRepository(this.plantBox);

  Future<List<PlantModel>> getAllPlants() async {
    return plantBox.values.toList();
  }

  Future<void> addPlant(PlantModel plant) async {
    await plantBox.put(plant.id, plant);
  }

  Future<void> deletePlant(String plantId) async {
    await plantBox.delete(plantId);
  }

  Future<void> updatePlant(PlantModel plant) async {
    await plantBox.put(plant.id, plant);
  }
}
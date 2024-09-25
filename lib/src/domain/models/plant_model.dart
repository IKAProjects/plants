import 'package:hive/hive.dart';

part 'plant_model.g.dart';

@HiveType(typeId: 0)
class PlantModel {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? description;

  @HiveField(4)
  int? temperature;

  @HiveField(5)
  PlantHumidity humidity;

  @HiveField(7)
  String? id;

  @HiveField(8)
  String? image;

  @HiveField(9)
  bool isFavorite;

  PlantModel({
    this.image,
    this.id,
    this.name,
    this.description,
    this.temperature,
    required this.humidity,
    required this.isFavorite,
  });
}


@HiveType(typeId: 1)
enum PlantHumidity {
  @HiveField(0)
  high,
  @HiveField(1)
  highDescr,
  @HiveField(2)
  medium,
  @HiveField(3)
  mediumDescr,
  @HiveField(4)
  low,
  @HiveField(5)
  lowDescr,
}

extension PlantHumidityExtension on PlantHumidity {
  String get getHumidityType {
    switch (this) {
      case PlantHumidity.high:
        return 'High humidity';
      case PlantHumidity.highDescr:
        return 'This means the plant needs to be in an environment with a lot of moisture in the air, like a bathroom or kitchen.';

      case PlantHumidity.medium:
        return 'Medium humidity';
      case PlantHumidity.mediumDescr:
        return 'This is the most common type of humidity in homes. Most houseplants thrive in this condition, which can be achieved with occasional misting or a humidifier.';

      case PlantHumidity.low:
        return 'Low humidity';
      case PlantHumidity.lowDescr:
        return 'This means the plant needs a dry environment. Many succulents and cacti can tolerate low humidity, but most plants will need extra care to thrive in this environment.';
    }
  }
}





part of 'plant_bloc.dart';

sealed class PlantEvent extends Equatable {
  const PlantEvent();

  @override
  List<Object?> get props => [];
}

class LoadPlants extends PlantEvent {
  const LoadPlants();
}

class AddPlant extends PlantEvent {
  final PlantModel plant;

  const AddPlant(this.plant);

  @override
  List<Object?> get props => [plant];
}

class DeletePlant extends PlantEvent {
  final String plantId;

  const DeletePlant(this.plantId);

  @override
  List<Object?> get props => [plantId];
}

class UpdatePlant extends PlantEvent {
  final PlantModel plant;

  const UpdatePlant(this.plant);

  @override
  List<Object?> get props => [plant];
}
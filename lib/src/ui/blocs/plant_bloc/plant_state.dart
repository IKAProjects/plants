part of 'plant_bloc.dart';

sealed class PlantState extends Equatable {
  const PlantState();

  @override
  List<Object?> get props => [];
}

final class PlantInitial extends PlantState {}

final class PlantLoading extends PlantState {}

final class PlantLoaded extends PlantState {
  final List<PlantModel> plants;

  const PlantLoaded(this.plants);

  @override
  List<Object?> get props => [plants];
}

final class PlantError extends PlantState {
  final String message;

  const PlantError(this.message);

  @override
  List<Object?> get props => [message];
}

final class PlantAdded extends PlantState {
  final PlantModel plant;

  const PlantAdded(this.plant);

  @override
  List<Object?> get props => [plant];
}

final class PlantDeleted extends PlantState {
  final String plantId;

  const PlantDeleted(this.plantId);

  @override
  List<Object?> get props => [plantId];
}

final class PlantUpdated extends PlantState {
  final PlantModel plant;

  const PlantUpdated(this.plant);

  @override
  List<Object?> get props => [plant];
}

final class PlantDetailState extends PlantState {
  const PlantDetailState({required this.plantModel});

  final PlantModel plantModel;

  @override
  List<Object?> get props => [plantModel];
}

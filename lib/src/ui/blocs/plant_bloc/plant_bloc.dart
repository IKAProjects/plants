import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:plants/src/domain/models/plant_model.dart';
import 'package:plants/src/data/plant_repository.dart'; // Ensure to import the PlantRepository

part 'plant_event.dart';
part 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  final PlantRepository plantRepository;

  PlantBloc(this.plantRepository) : super(PlantInitial()) {
    on<LoadPlants>(_onLoadPlants);
    on<AddPlant>(_onAddPlant);
    on<DeletePlant>(_onDeletePlant);
    on<UpdatePlant>(_onUpdatePlant);
  }

  Future<void> _onLoadPlants(LoadPlants event, Emitter<PlantState> emit) async {
    emit(PlantLoading());
    try {
      final plants = await plantRepository.getAllPlants();
      emit(PlantLoaded(plants));
    } catch (e) {
      emit(PlantError(e.toString()));
    }
  }

  Future<void> _onAddPlant(AddPlant event, Emitter<PlantState> emit) async {
    emit(PlantLoading());
    try {
      await plantRepository.addPlant(event.plant);
      final plants = await plantRepository.getAllPlants();
      emit(PlantLoaded(plants));
    } catch (e) {
      emit(PlantError(e.toString()));
    }
  }

  Future<void> _onDeletePlant(DeletePlant event, Emitter<PlantState> emit) async {
    emit(PlantLoading());
    try {
      await plantRepository.deletePlant(event.plantId);
      final plants = await plantRepository.getAllPlants();
      emit(PlantLoaded(plants));
    } catch (e) {
      emit(PlantError(e.toString()));
    }
  }

  Future<void> _onUpdatePlant(UpdatePlant event, Emitter<PlantState> emit) async {
    emit(PlantLoading());
    try {
      await plantRepository.updatePlant(event.plant);
      final plants = await plantRepository.getAllPlants();
      emit(PlantLoaded(plants));
    } catch (e) {
      emit(PlantError(e.toString()));
    }
  }
}
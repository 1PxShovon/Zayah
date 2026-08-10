import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/service.dart';
import '../../domain/usecases/get_services_usecase.dart';

sealed class ServiceState {
  const ServiceState();
}

class ServiceInitial extends ServiceState {
  const ServiceInitial();
}

class ServiceLoading extends ServiceState {
  const ServiceLoading();
}

class ServiceLoaded extends ServiceState {
  final List<Service> services;

  const ServiceLoaded(this.services);
}

class ServiceError extends ServiceState {
  final String message;

  const ServiceError(this.message);
}

class ServiceCubit extends Cubit<ServiceState> {
  final GetServicesUseCase getServicesUseCase;

  ServiceCubit({
    required this.getServicesUseCase,
  }) : super(const ServiceInitial());

  Future<void> loadServices({
    String? categoryId,
  }) async {
    emit(const ServiceLoading());

    try {
      final services = await getServicesUseCase(
        categoryId: categoryId,
      );

      emit(ServiceLoaded(services));
    } catch (e) {
      emit(ServiceError(e.toString()));
    }
  }

  Future<void> refresh({
    String? categoryId,
  }) async {
    await loadServices(
      categoryId: categoryId,
    );
  }
}
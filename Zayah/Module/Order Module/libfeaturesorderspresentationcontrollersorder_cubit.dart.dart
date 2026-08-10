import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/order.dart';
import '../../domain/usecases/get_my_orders_usecase.dart';

sealed class OrderState {
  const OrderState();
}

class OrderInitial extends OrderState {
  const OrderInitial();
}

class OrderLoading extends OrderState {
  const OrderLoading();
}

class OrderLoaded extends OrderState {
  final List<Order> orders;

  const OrderLoaded(this.orders);
}

class OrderError extends OrderState {
  final String message;

  const OrderError(this.message);
}

class OrderCubit extends Cubit<OrderState> {
  final GetMyOrdersUseCase getMyOrdersUseCase;

  OrderCubit({
    required this.getMyOrdersUseCase,
  }) : super(const OrderInitial());

  Future<void> loadOrders({
    required String customerId,
  }) async {
    emit(const OrderLoading());

    try {
      final orders = await getMyOrdersUseCase(
        customerId: customerId,
      );

      emit(OrderLoaded(orders));
    } catch (e) {
      emit(OrderError(e.toString()));
    }
  }
}
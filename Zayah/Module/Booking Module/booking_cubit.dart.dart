import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/booking.dart';
import '../../domain/usecases/create_booking_usecase.dart';

sealed class BookingState {}

class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingSuccess extends BookingState {
  final Booking booking;

  BookingSuccess(this.booking);
}

class BookingFailure extends BookingState {
  final String message;

  BookingFailure(this.message);
}

class BookingCubit
    extends Cubit<BookingState> {

  final CreateBookingUseCase
      createBookingUseCase;

  BookingCubit({
    required this.createBookingUseCase,
  }) : super(BookingInitial());

  Future<void> createBooking(
    Booking booking,
  ) async {

    emit(BookingLoading());

    try {
      final result =
          await createBookingUseCase(
        booking,
      );

      emit(
        BookingSuccess(result),
      );
    } catch (e) {
      emit(
        BookingFailure(
          e.toString(),
        ),
      );
    }
  }
}
sl.registerLazySingleton<AuthService>(
  () => AuthService(sl()),
);

sl.registerLazySingleton(
  () => BookingFirestoreDataSource(sl()),
);

sl.registerLazySingleton(
  () => BookingRepositoryImpl(sl()),
);

sl.registerLazySingleton(
  () => CreateBookingUseCase(sl()),
);

sl.registerFactory(
  () => BookingCubit(
    createBookingUseCase: sl(),
  ),
);
import 'package:get_it/get_it.dart';
import 'package:sakeny/features/home/controllers/home_cubit.dart';
import 'package:sakeny/features/profile/edit_profile/controllers/edit_profile_cubit.dart';

import '../network/dio_client.dart';

final sl = GetIt.instance;

void serviceLocatorSetup() {
  sl.registerSingleton<DioClient>(DioClient());

  // cubits
  // sl.registerLazySingleton<HomeCubit>(() => HomeCubit());
  // sl.registerLazySingleton<EditProfileCubit>(() => EditProfileCubit());

}

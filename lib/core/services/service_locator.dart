import 'package:get_it/get_it.dart';

import '../../features/onboarding/controllers/onboarding_cubit.dart';

final sl = GetIt.instance;

void serviceLocatorSetup(){
  sl.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());
}
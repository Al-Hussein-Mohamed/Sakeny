import 'package:get_it/get_it.dart';

import '../../features/onboarding/controllers/onboarding_cubit.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void serviceLocatorSetup(){
  sl.registerSingleton<DioClient>(DioClient());
}
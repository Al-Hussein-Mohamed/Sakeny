import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sakeny/core/services/service_locator.dart';

import '../../features/login/models/sign_in_params.dart';
import '../../features/register/models/register_req_params.dart';
import '../../utils/constants/const_api.dart';
import '../network/dio_client.dart';

class ApiAuthServices{

  // register
  static Future<Either> register({required RegisterReqParams registerReqParams}) async {
    try{
      print(registerReqParams.toJson());
      final response  = await sl<DioClient>().post(
        ConstApi.registerUrl,
        data: registerReqParams.toJson(),
      );

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data);
    }
  }

  // login
  static Future<Either> signIn({required SignInParams signInParams}) async{
    try{
      final response = await sl<DioClient>().post(
        ConstApi.signInUrl,
        data: signInParams.toJson(),
      );
      return Right(response);
    } on DioException catch (e){
      return Left(e.response!.data);
    }
  }
}
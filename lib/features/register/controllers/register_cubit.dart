import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import "package:flutter/material.dart";
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/core/services/api_auth_services.dart';

import '../../../utils/validators/validation.dart';
import '../models/register_req_params.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  bool isFirstNameValid = true;
  bool isLastNameValid = true;
  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;
  bool isPhoneNumberValid = true;
  bool isLocationValid = true;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  void goToLogin(BuildContext context, {bool sendData = false}) {
    Map<String, dynamic> args = {};
    if(sendData){
      args["email"] = emailController.text;
      args["password"] = passwordController.text;
    }
    Navigator.pushReplacementNamed(context, PageRouteNames.login, arguments: args);
  }

  void goToLoginWithData(BuildContext context) {
    Navigator.pushReplacementNamed(context, PageRouteNames.login, arguments: {
      "email": emailController.text,
      "password": passwordController.text,
    });
  }

  void register() {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      emit(RegisterLoading());
      ApiAuthServices.register(
        registerReqParams: RegisterReqParams(
          firstName: firstNameController.text,
          secondName: lastNameController.text,
          email: emailController.text,
          phoneNumber: phoneNumberController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          longitude: 0,
          latitude: 0,
        ),
      ).then((response) {
        response.fold(
          (error) {
            EasyLoading.dismiss();
            emit(RegisterFailed(errorMessage: error));
          },
          (data) {
            EasyLoading.dismiss();
            emit(RegisterSuccess());
          },
        );
      });
    } else {
      emit(RegisterInitial());
    }
  }

  void togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    emit(RegisterInitial());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    emit(RegisterInitial());
  }

  // validation methods

  String? firstNameValidator(String? value) {
    String? res = Validator.validateName(value);
    isFirstNameValid = (res == null);
    return res;
  }

  String? lastNameValidator(String? value) {
    String? res = Validator.validateName(value);
    isLastNameValid = (res == null);
    return res;
  }

  String? emailValidator(String? value) {
    String? res = Validator.validateEmail(value);
    isEmailValid = (res == null);
    return res;
  }

  String? passwordValidator(String? value) {
    if (passwordController.text != confirmPasswordController.text) {
      isPasswordValid = false;
      return "passwords do not match";
    }

    String? res = Validator.validatePassword(value);
    isPasswordValid = (res == null);
    return res;
  }

  String? confirmPasswordValidator(String? value) {
    if (passwordController.text != confirmPasswordController.text) {
      isConfirmPasswordValid = false;
      return "passwords do not match";
    }

    String? res = Validator.validatePassword(value);
    isConfirmPasswordValid = (res == null);
    return res;
  }

  String? phoneNumberValidator(String? value) {
    String? res = Validator.validatePhoneNumber(value);
    isPhoneNumberValid = (res == null);
    return res;
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/features/login/models/sign_in_params.dart';

import '../../../core/services/api_auth_services.dart';
import '../../../utils/validators/validation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void goToOnboarding(BuildContext context) {
    Navigator.pushReplacementNamed(context, PageRouteNames.onboarding);
  }

  void goToRegister(BuildContext context) {
    Navigator.pushNamed(context, PageRouteNames.register);
  }

  void goToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      PageRouteNames.home,
          (route) => false,
    );
  }

  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isPasswordObscure = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailValidator(String? value) {
    String? res = Validator.validateEmail(value);
    isEmailValid = (res == null);
    return res;
  }

  String? passwordValidator(String? value) {
    String? res = Validator.validateLoginPassword(value);
    isPasswordValid = (res == null);
    return res;
  }

  void togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    emit(LoginInitial());
  }

  void setEmailAndPassword(String? email, String? password) {
    isEmailValid = true;
    isPasswordValid = true;
    isPasswordObscure = true;
    emailController.text = email?? "";
    passwordController.text = password ?? "";
    emit(LoginInitial());
  }

  void signIn() {
    if (formKey.currentState!.validate()) {
      EasyLoading.show();
      emit(LoginLoading());
      ApiAuthServices.signIn(
        signInParams: SignInParams(
          email: emailController.text,
          password: passwordController.text,
          rememberMe: false,
        ),
      ).then((res) {
        res.fold((error) async {
          EasyLoading.dismiss();
          emit(LoginFailed(errorMessage: error));
        }, (data) {
          EasyLoading.dismiss();
          emit(LoginSuccess());
        });
      });
    } else {
      emit(LoginInitial());
    }
  }
}

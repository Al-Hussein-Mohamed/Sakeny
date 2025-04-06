import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../../utils/validators/validation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isPasswordObscure = true;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? emailValidator(String? value) {
    String? res =  Validator.validateEmail(value);
    isEmailValid = (res == null);
    return res;
  }

  String? passwordValidator(String? value){
    String? res =  Validator.validatePassword(value);
    isPasswordValid = (res == null);
    return res;
  }

  void togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    emit(LoginInitial());
  }

  void setEmailAndPassword(String email, String password) {
    isEmailValid = true;
    isPasswordValid = true;
    isPasswordObscure = true;
    emailController.text = email;
    passwordController.text = password;
    emit(LoginInitial());
  }

  void signIn(){
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());

    } else {
      emit(LoginFailed());
    }

  }
}

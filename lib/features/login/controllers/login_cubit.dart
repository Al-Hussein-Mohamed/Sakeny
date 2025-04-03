import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

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
    if (value == null || value.isEmpty) {
      isEmailValid = false;
      return 'Email is required.';
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      isEmailValid = false;
      return 'Invalid email address.';
    }

    isEmailValid = true;
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      isPasswordValid = false;
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      isPasswordValid = false;
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      isPasswordValid = false;
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      isPasswordValid = false;
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      isPasswordValid = false;
      return 'Password must contain at least one special character.';
    }

    isPasswordValid = true;
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordObscure = !isPasswordObscure;
    emit(LoginInitial());
  }


  void signIn(){
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      // Perform login logic here
      // If successful, emit LoginSuccess
      // If failed, emit LoginFailed
    } else {
      emit(LoginFailed());
    }

  }


}

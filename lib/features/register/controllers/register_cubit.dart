import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import "package:flutter/material.dart";

import '../../../utils/validators/validation.dart';

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
    String? res = Validator.validatePassword(value);
    isPasswordValid = (res == null);
    return res;
  }

  String? confirmPasswordValidator(String? value) {
    String? res = Validator.validatePassword(value);
    isConfirmPasswordValid = (res == null);
    return res;
  }

  String? phoneNumberValidator(String? value) {
    String? res = Validator.validatePhoneNumber(value);
    isPhoneNumberValid = (res == null);
    return res;
  }

  void register() {
    // if (formKey.currentState!.validate()) {
    //   emit(RegisterLoading());
    //   // Perform registration logic here
    //   // If successful, emit RegisterSuccess
    //   // If failed, emit RegisterFailed
    // } else {
    //   emit(RegisterFailed());
    // }
    emit(RegisterSuccess());
  }
}

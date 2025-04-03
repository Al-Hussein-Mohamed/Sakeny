import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import "package:flutter/material.dart";
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
    isPasswordObscure = !isPasswordObscure;
    emit(RegisterInitial());
  }

  // validation methods
  String? firstNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      isFirstNameValid = false;
      return "First name is required";
    }
    isFirstNameValid = true;
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value == null || value.isEmpty) {
      isLastNameValid = false;
      return "Last name is required";
    }
    isLastNameValid = true;
    return null;
  }

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

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      isConfirmPasswordValid = false;
      return 'Confirm password is required.';
    }

    if (value != passwordController.text) {
      isConfirmPasswordValid = false;
      return 'Passwords do not match.';
    }

    isConfirmPasswordValid = true;
    return null;
  }

}

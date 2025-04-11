import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/utils/validators/validation.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial()) {
    setup();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  void save() {
    if (formKey.currentState!.validate()) {
      emit(EditProfileSuccess());
    } else {
      emit(EditProfileFailed());
    }
  }

  void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, PageRouteNames.home);
  }

  void openDrawer() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  void closeDrawer(){
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.closeEndDrawer();
    }
  }

  void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  // -----------------------------------------------------------------------

  bool isFirstNameValid = true;
  bool isSecondNameValid = true;
  bool isEmailValid = true;
  bool isPhoneNumberValid = true;
  bool isPasswordValid = true;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void setup() {
    isFirstNameValid = true;
    isSecondNameValid = true;
    isEmailValid = true;
    isPhoneNumberValid = true;
    isPasswordValid = true;
  }

  String? firstNameValidator(String? value) {
    String? res = Validator.validateName(value);
    isFirstNameValid = (res == null);
    return res;
  }

  String? secondNameValidator(String? value) {
    String? res = Validator.validateName(value);
    isSecondNameValid = (res == null);
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

  String? phoneNumberValidator(String? value) {
    String? res = Validator.validatePhoneNumber(value);
    isPhoneNumberValid = (res == null);
    return res;
  }
}

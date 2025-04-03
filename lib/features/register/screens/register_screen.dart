import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:sakeny/common/widgets/text_fields/email_text_field.dart";
import "package:sakeny/common/widgets/text_fields/name_text_field.dart";
import "package:sakeny/features/register/screens/widgets/profile_picture_custom_widget.dart";
import "package:sakeny/utils/constants/const_text.dart";

import "../../../common/widgets/text_fields/password_text_field.dart";
import "../../../common/widgets/top_bar_language.dart";
import "../controllers/register_cubit.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    RegisterCubit registerCubit = context.read<RegisterCubit>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top bar with language selection
              TopBarLanguage(function: () => Navigator.pop(context)),
              SizedBox(height: 20.h),

              // Profile picture widget
              const ProfilePictureCustomWidget(),
              SizedBox(height: 12.h),
              Text(ConstText.registerTitle, style: theme.textTheme.titleLarge),
              SizedBox(
                height: 15.h,
              ),

              // Form for first and last name
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
                child: NameTextField(
                  label: ConstText.firstName,
                  isNameValid: registerCubit.isFirstNameValid,
                  nameController: registerCubit.firstNameController,
                  nameValidator: registerCubit.firstNameValidator,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
                child: NameTextField(
                  label: ConstText.lastName,
                  isNameValid: registerCubit.isLastNameValid,
                  nameController: registerCubit.lastNameController,
                  nameValidator: registerCubit.lastNameValidator,
                ),
              ),

              // Form for email
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
                child: EmailTextField(
                  emailController: registerCubit.emailController,
                  isEmailValid: registerCubit.isEmailValid,
                  emailValidator: registerCubit.emailValidator,
                ),
              ),

              // Form for password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
                child: PasswordTextField(
                  passwordController: registerCubit.passwordController,
                  isPasswordValid: registerCubit.isPasswordValid,
                  isPasswordObscure: registerCubit.isPasswordObscure,
                  passwordValidator: registerCubit.passwordValidator,
                  onPasswordVisibilityToggle: registerCubit.togglePasswordVisibility,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
                child: PasswordTextField(
                  passwordController: registerCubit.confirmPasswordController,
                  isPasswordValid: registerCubit.isConfirmPasswordValid,
                  isPasswordObscure: registerCubit.isConfirmPasswordObscure,
                  passwordValidator: registerCubit.confirmPasswordValidator,
                  onPasswordVisibilityToggle: registerCubit.toggleConfirmPasswordVisibility,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

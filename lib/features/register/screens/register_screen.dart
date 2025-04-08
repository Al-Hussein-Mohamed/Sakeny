import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:sakeny/common/widgets/text_fields/email_text_field.dart";
import "package:sakeny/common/widgets/text_fields/name_text_field.dart";
import "package:sakeny/features/register/screens/widgets/profile_picture_custom_widget.dart";
import "package:sakeny/utils/constants/const_text.dart";

import "../../../common/widgets/selcect_location.dart";
import "../../../common/widgets/text_fields/password_text_field.dart";
import "../../../common/widgets/text_fields/phone_text_field.dart";
import "../../../common/widgets/top_bar_language.dart";
import "../controllers/register_cubit.dart";

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = context.read<RegisterCubit>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: registerCubit.formKey,
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccess) {
                Navigator.pop(context, {
                  'email': registerCubit.emailController.text,
                  'password': registerCubit.passwordController.text,
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Account created successfully"),
                    backgroundColor: Colors.green,
                  ),
                );
              } else if (state is RegisterFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: RegisterBody(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    RegisterCubit registerCubit = context.read<RegisterCubit>();
    return Column(
      children: [
        // Top bar with language selection
        TopBarLanguage(function: () => Navigator.pop(context)),
        SizedBox(height: 20.h),

        // Profile picture widget
        const ProfilePictureCustomWidget(),

        SizedBox(
          height: 15.h,
        ),

        // Form for first
        NameTextField(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
          label: ConstText.firstName,
          isNameValid: registerCubit.isFirstNameValid,
          nameController: registerCubit.firstNameController,
          nameValidator: registerCubit.firstNameValidator,
        ),

        // Form for last name
        NameTextField(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
          label: ConstText.lastName,
          isNameValid: registerCubit.isLastNameValid,
          nameController: registerCubit.lastNameController,
          nameValidator: registerCubit.lastNameValidator,
        ),

        // Form for email
        EmailTextField(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
          emailController: registerCubit.emailController,
          isEmailValid: registerCubit.isEmailValid,
          emailValidator: registerCubit.emailValidator,
        ),

        // Form for phone number
        PhoneTextField(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
          label: ConstText.phoneNumber,
          isPhoneValid: registerCubit.isPhoneNumberValid,
          phoneController: registerCubit.phoneNumberController,
          phoneValidator: registerCubit.phoneNumberValidator,
        ),

        // Form for password
        PasswordTextField(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
          label: ConstText.password,
          passwordController: registerCubit.passwordController,
          isPasswordValid: registerCubit.isPasswordValid,
          isPasswordObscure: registerCubit.isPasswordObscure,
          passwordValidator: registerCubit.passwordValidator,
          onPasswordVisibilityToggle: registerCubit.togglePasswordVisibility,
        ),

        // Form for confirm password
        PasswordTextField(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
          label: ConstText.confirmPassword,
          passwordController: registerCubit.confirmPasswordController,
          isPasswordValid: registerCubit.isConfirmPasswordValid,
          isPasswordObscure: registerCubit.isConfirmPasswordObscure,
          passwordValidator: registerCubit.confirmPasswordValidator,
          onPasswordVisibilityToggle: registerCubit.toggleConfirmPasswordVisibility,
        ),

        // Form for location
        SelectLocation(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 14.r),
          label: ConstText.location,
          isPhoneValid: registerCubit.isPhoneNumberValid,
          phoneValidator: registerCubit.firstNameValidator,
        ),

        // Register button
        Padding(
          padding: EdgeInsets.all(18.r),
          child: ElevatedButton(
            onPressed: registerCubit.register,
            child: Text(ConstText.create),
          ),
        ),
      ],
    );
  }
}

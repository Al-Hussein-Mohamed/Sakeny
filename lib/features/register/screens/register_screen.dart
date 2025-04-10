import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/common/widgets/custom_pop_scope.dart';
import 'package:sakeny/common/widgets/text_fields/email_text_field.dart';
import 'package:sakeny/common/widgets/text_fields/name_text_field.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/core/services/snack_bar/snack_bar_service.dart';
import 'package:sakeny/features/register/screens/widgets/profile_picture_custom_widget.dart';
import 'package:sakeny/utils/constants/const_text.dart';
import '../../../common/widgets/selcect_location.dart';
import '../../../common/widgets/text_fields/password_text_field.dart';
import '../../../common/widgets/text_fields/phone_text_field.dart';
import '../../../common/widgets/top_bar_language.dart';
import '../controllers/register_cubit.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.read<RegisterCubit>();
    final theme = Theme.of(context);

    return CustomPopScope(
      nextRoute: PageRouteNames.login,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: Form(
            key: registerCubit.formKey,
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterSuccess) {
                  SnackBarService.showSuccess(context, "Registration successful");
                  registerCubit.goToLogin(context, sendData: true);
                } else if (state is RegisterFailed) {
                  SnackBarService.showError(context, state.errorMessage);
                }
              },
              builder: (context, state) {
                return const _RegisterBody();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterBody extends StatelessWidget {
  const _RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterCubit registerCubit = context.read<RegisterCubit>();
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 18),
      children: [
        // Top bar with language selection.
        TopBarLanguage(
          padding: const EdgeInsets.symmetric(vertical: 12),
          function: () => registerCubit.goToLogin(context),
        ),
        SizedBox(height: 20.h),
        // Profile picture widget.
        const RepaintBoundary(child: ProfilePictureCustomWidget()),
        const SizedBox(height: 15),

        // First name field.
        NameTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.firstName,
          isNameValid: registerCubit.isFirstNameValid,
          nameController: registerCubit.firstNameController,
          nameValidator: registerCubit.firstNameValidator,
        ),
        const SizedBox(height: 15),

        // Last name field.
        NameTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.lastName,
          isNameValid: registerCubit.isLastNameValid,
          nameController: registerCubit.lastNameController,
          nameValidator: registerCubit.lastNameValidator,
        ),
        const SizedBox(height: 15),

        // Email field.
        EmailTextField(
          padding: const EdgeInsets.all(5),
          emailController: registerCubit.emailController,
          isEmailValid: registerCubit.isEmailValid,
          emailValidator: registerCubit.emailValidator,
        ),
        const SizedBox(height: 15),

        // Phone number field.
        PhoneTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.phoneNumber,
          isPhoneValid: registerCubit.isPhoneNumberValid,
          phoneController: registerCubit.phoneNumberController,
          phoneValidator: registerCubit.phoneNumberValidator,
        ),
        const SizedBox(height: 15),

        // Password field.
        PasswordTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.password,
          passwordController: registerCubit.passwordController,
          isPasswordValid: registerCubit.isPasswordValid,
          isPasswordObscure: registerCubit.isPasswordObscure,
          passwordValidator: registerCubit.passwordValidator,
          onPasswordVisibilityToggle: registerCubit.togglePasswordVisibility,
        ),
        const SizedBox(height: 15),

        // Confirm password field.
        PasswordTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.confirmPassword,
          passwordController: registerCubit.confirmPasswordController,
          isPasswordValid: registerCubit.isConfirmPasswordValid,
          isPasswordObscure: registerCubit.isConfirmPasswordObscure,
          passwordValidator: registerCubit.confirmPasswordValidator,
          onPasswordVisibilityToggle: registerCubit.toggleConfirmPasswordVisibility,
        ),
        const SizedBox(height: 15),

        // Location field.
        SelectLocation(
          padding: const EdgeInsets.all(5),
          label: ConstText.location,
          isPhoneValid: registerCubit.isPhoneNumberValid,
          phoneValidator: registerCubit.firstNameValidator,
        ),
        const SizedBox(height: 15),

        // Register button.
        Hero(
          tag: "button",
          child: ElevatedButton(
            onPressed: registerCubit.register,
            child: Text(ConstText.create),
          ),
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sakeny/common/widgets/text_fields/email_text_field.dart';
import 'package:sakeny/features/login/screens/widgets/sign_in_card_widget.dart';

import '../../../common/widgets/text_fields/password_text_field.dart';
import '../../../common/widgets/top_bar_language.dart';
import '../../../core/config/page_route_name.dart';
import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_images.dart';
import '../../../utils/constants/const_text.dart';
import '../controllers/login_cubit.dart';
import '../models/sing_in_card_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit loginCubit = context.read<LoginCubit>();

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: loginCubit.formKey,
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) => LoginBody(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    LoginCubit loginCubit = context.read<LoginCubit>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            // Top bar with language selection
            TopBarLanguage(function: () => Navigator.pop(context)),
            SizedBox(height: 50.h),

            // Logo
            Image.asset(ConstImages.loginLogo, scale: 1.85),
            SizedBox(height: 18.h),

            // Login title
            Text(ConstText.loginTitle, style: theme.textTheme.titleLarge),
            SizedBox(height: 22.h),

            // Email field
            Padding(
              padding: EdgeInsets.all(20.r),
              child: EmailTextField(
                emailController: loginCubit.emailController,
                emailValidator: loginCubit.emailValidator,
                isEmailValid: loginCubit.isEmailValid,
              ),
            ),

            // Password field
            Padding(
              padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 8.r, bottom: 8.r),
              child: PasswordTextField(
                isPasswordObscure: loginCubit.isPasswordObscure,
                isPasswordValid: loginCubit.isPasswordValid,
                passwordController: loginCubit.passwordController,
                passwordValidator: loginCubit.passwordValidator,
                onPasswordVisibilityToggle: loginCubit.togglePasswordVisibility,
              ),
            ),

            // Forgot password
            Padding(
              padding: EdgeInsets.only(right: 18.r, bottom: 12.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(ConstText.forgetPassword,
                      style: theme.textTheme.bodySmall?.copyWith(color: ConstColors.linkColor)),
                ],
              ),
            ),

            // Login button
            Hero(
              tag: "auth-button",
              child: Padding(
                padding: EdgeInsets.all(18.r),
                child: ElevatedButton(
                  onPressed: () => loginCubit.signIn(),
                  child: Text(ConstText.signIn),
                ),
              ),
            ),

            // Login with services
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Text(ConstText.or, style: theme.textTheme.bodySmall),
            ),

            // Sign in cards
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                children:
                    signInCards.map((card) => SignInCardWidget(signInCardModel: card)).toList(),
              ),
            ),

            // create account
            Padding(
              padding: EdgeInsets.all(12.r),
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, PageRouteNames.register),
                child: Text(ConstText.createAccount,
                    style: theme.textTheme.bodySmall?.copyWith(color: ConstColors.linkColor)),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(18.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(ConstText.guest,
                  style: theme.textTheme.titleSmall?.copyWith(color: ConstColors.linkColor)),
              SizedBox(width: 2),
              Icon(
                Icons.arrow_forward,
                size: 18.spMin,
                color: ConstColors.linkColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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

            // Title
            TitleWidget(),

            SizedBox(height: 22.h),

            // Email field
            EmailTextField(
              padding: EdgeInsets.all(20.r),
              emailController: loginCubit.emailController,
              emailValidator: loginCubit.emailValidator,
              isEmailValid: loginCubit.isEmailValid,
            ),

            // Password field
            PasswordTextField(
              padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 8.r, bottom: 8.r),
              label: ConstText.password,
              isPasswordObscure: loginCubit.isPasswordObscure,
              isPasswordValid: loginCubit.isPasswordValid,
              passwordController: loginCubit.passwordController,
              passwordValidator: loginCubit.passwordValidator,
              onPasswordVisibilityToggle: loginCubit.togglePasswordVisibility,
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
              padding: EdgeInsets.all(2.r),
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
            GestureDetector(
              onTap: () async {
                // Navigator.pushNamed(context, PageRouteNames.register, arguments: {
                //   "emailController": loginCubit.emailController,
                //   "passwordController": loginCubit.passwordController,
                // });
                final result = await Navigator.pushNamed(context, PageRouteNames.register);
                if (result != null && result is Map<String, dynamic>) {
                  final email = result['email'] as String;
                  final password = result['password'] as String;
                  loginCubit.setEmailAndPassword(email, password);
                }
              },
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Text(ConstText.createAccount,
                    style: theme.textTheme.bodySmall?.copyWith(color: ConstColors.linkColor)),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => _goToHome(context),
          child: Padding(
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
        ),
      ],
    );
  }

  void _goToHome(BuildContext context) {
    Navigator.pushNamed(context, PageRouteNames.home);
    // Navigator.pushNamedAndRemoveUntil(
    //   context,
    //   PageRouteNames.home,
    //   (route) => false,
    // );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Hero(
      tag: "img",
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            Image.asset(ConstImages.loginLogo, scale: 1.85),
            SizedBox(height: 8),
            Text(ConstText.loginTitle, style: theme.textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}

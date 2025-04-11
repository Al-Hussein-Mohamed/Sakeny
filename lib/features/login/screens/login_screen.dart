import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sakeny/common/widgets/custom_pop_scope.dart';
import 'package:sakeny/common/widgets/text_fields/email_text_field.dart';
import 'package:sakeny/core/services/snack_bar/snack_bar_service.dart';
import 'package:sakeny/features/login/screens/widgets/sign_in_card_widget.dart';

import '../../../common/widgets/text_fields/password_text_field.dart';
import '../../../common/widgets/top_bar_language.dart';
import '../../../core/routing/page_route_name.dart';
import '../../../utils/constants/const_colors.dart';
import '../../../utils/constants/const_images.dart';
import '../../../utils/constants/const_text.dart';
import '../controllers/login_cubit.dart';
import '../models/sing_in_card_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final route = ModalRoute.of(context);
    final args = route?.settings.arguments;

    String? email;
    String? password;

    if (args != null && args is Map<String, String>) {
      email = args["email"];
      password = args["password"];
    }

    final LoginCubit loginCubit = context.read<LoginCubit>()..setEmailAndPassword(email, password);
    final theme = Theme.of(context);
    return CustomPopScope(
      nextRoute: PageRouteNames.onboarding,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: Form(
            key: loginCubit.formKey,
            child: LayoutBuilder(
              builder: (context, constraints) =>
                  SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraints.maxHeight),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if(state is LoginSuccess){
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              PageRouteNames.home,
                              (route) => false,
                            );
                          } else if (state is LoginFailed) {
                            SnackBarService.showError(context, state.errorMessage);
                          }
                        },
                        builder: (context, state) {
                          return LoginBody();
                        },
                      ),
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
            TopBarLanguage(function: () => loginCubit.goToOnboarding(context)),

            SizedBox(height: 50.h),

            // Title
            const TitleWidget(),

            SizedBox(height: 22.h),

            // Email field
            EmailTextField(
              padding: EdgeInsets.all(20.r),
              emailController: loginCubit.emailController,
            ),

            // Password field
            PasswordTextField(
              padding: EdgeInsets.only(left: 20.r, right: 20.r, top: 8.r, bottom: 8.r),
              label: ConstText.password,
              passwordController: loginCubit.passwordController,
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
              tag: "button",
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
              onTap: () => loginCubit.goToRegister(context),
              child: Padding(
                padding: EdgeInsets.all(12.r),
                child: Text(ConstText.createAccount,
                    style: theme.textTheme.bodySmall?.copyWith(color: ConstColors.linkColor)),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => loginCubit.goToHome(context),
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

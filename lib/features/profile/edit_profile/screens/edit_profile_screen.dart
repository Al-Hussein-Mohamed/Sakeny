import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/common/widgets/custom_app_bar.dart';
import 'package:sakeny/common/widgets/custom_pop_scope.dart';
import 'package:sakeny/common/widgets/custom_scaffold.dart';
import 'package:sakeny/common/widgets/selcect_location.dart';
import 'package:sakeny/common/widgets/text_fields/email_text_field.dart';
import 'package:sakeny/common/widgets/text_fields/name_text_field.dart';
import 'package:sakeny/common/widgets/text_fields/phone_text_field.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/features/profile/edit_profile/controllers/edit_profile_cubit.dart';
import 'package:sakeny/features/profile/edit_profile/screens/widget/change_password_button.dart';
import 'package:sakeny/features/profile/edit_profile/screens/widget/profile_picture_widget.dart';
import 'package:sakeny/features/profile/edit_profile/screens/widget/save_button.dart';
import 'package:sakeny/utils/constants/const_text.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();
    return CustomPopScope(
      nextRoute: PageRouteNames.home,
      child: CustomScaffold(
        scaffoldKey: editProfileCubit.scaffoldKey,
        appBar: CustomAppBar.buildAppBar(
          context: context,
          title: ConstText.profileEdit,
          openDrawer: () =>
              editProfileCubit.scaffoldKey.currentState?.openEndDrawer(),
        ),
        body: Form(
          key: editProfileCubit.formKey,
          child: BlocConsumer<EditProfileCubit, EditProfileState>(
            listener: (context, state) {
              // Optional: handle state changes or error messages here.
            },
            builder: (context, state) {
              return const _EditProfileList();
            },
          ),
        ),
      ),
    );
  }
}

class _EditProfileList extends StatelessWidget {
  const _EditProfileList({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      children: [
        const SizedBox(height: 30),
        const RepaintBoundary(child: ProfilePictureWidget()),
        const SizedBox(height: 30),

        // First Name Text Field
        NameTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.firstName,
          isNameValid: editProfileCubit.isFirstNameValid,
          nameController: editProfileCubit.firstNameController,
          nameValidator: editProfileCubit.firstNameValidator,
        ),
        const SizedBox(height: 15),
        // Last Name Text Field
        NameTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.lastName,
          isNameValid: editProfileCubit.isLastNameValid,
          nameController: editProfileCubit.lastNameController,
          nameValidator: editProfileCubit.lastNameValidator,
        ),
        const SizedBox(height: 15),
        // Phone Number Text Field
        PhoneTextField(
          padding: const EdgeInsets.all(5),
          label: ConstText.phoneNumber,
          isPhoneValid: editProfileCubit.isPhoneNumberValid,
          phoneController: editProfileCubit.phoneNumberController,
          phoneValidator: editProfileCubit.phoneNumberValidator,
        ),
        const SizedBox(height: 15),
        // Location Text Field
        SelectLocation(
          padding: const EdgeInsets.all(5),
          label: ConstText.location,
          isPhoneValid: editProfileCubit.isPhoneNumberValid,
          phoneValidator: editProfileCubit.firstNameValidator,
        ),
        const SizedBox(height: 15),
        // Email Text Field
        EmailTextField(
          padding: const EdgeInsets.all(5),
          isEmailValid: editProfileCubit.isEmailValid,
          emailController: editProfileCubit.emailController,
          emailValidator: editProfileCubit.emailValidator,
        ),
        const SizedBox(height: 15),
        // Change Password Button
        const ChangePasswordButton(),
        const SizedBox(height: 10),
        // Save Button
        const SaveButton(),
        const SizedBox(height: 18),
      ],
    );
  }
}

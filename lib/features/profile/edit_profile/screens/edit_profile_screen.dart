import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/common/widgets/custom_app_bar.dart';
import 'package:sakeny/common/widgets/custom_pop_scope.dart';
import 'package:sakeny/common/widgets/custom_scaffold.dart';
import 'package:sakeny/common/widgets/select_location.dart';
import 'package:sakeny/common/widgets/text_fields/email_text_field.dart';
import 'package:sakeny/common/widgets/text_fields/name_text_field.dart';
import 'package:sakeny/common/widgets/text_fields/phone_text_field.dart';
import 'package:sakeny/core/routing/page_route_name.dart';
import 'package:sakeny/features/profile/edit_profile/controllers/edit_profile_cubit.dart';
import 'package:sakeny/utils/constants/const_colors.dart';
import 'package:sakeny/utils/constants/const_images.dart';
import 'package:sakeny/utils/constants/const_text.dart';
import 'package:sakeny/utils/constants/dist.dart';

part 'widget/edit_profile_body_comp.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return CustomPopScope(
      nextRoute: PageRouteNames.home,
      child: CustomScaffold(
        scaffoldKey: editProfileCubit.scaffoldKey,
        screenTitle: ConstText.profileEdit,
        openDrawer: editProfileCubit.openDrawer,
        onBack: () => editProfileCubit.goToHome(context),
        body: Form(
          key: editProfileCubit.formKey,
          child: BlocListener<EditProfileCubit, EditProfileState>(
            listener: (context, state) {},
            child: SingleChildScrollView(
              child: Padding(
                padding: Dist.screenPadding,
                child: const _EditProfileBody(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EditProfileBody extends StatelessWidget {
  const _EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10),
        _ProfilePicture(),
        SizedBox(height: 30),
        _FirstName(),
        SizedBox(height: 20),
        _SecondName(),
        SizedBox(height: 20),
        _PhoneNumber(),
        SizedBox(height: 20),
        _Email(),
        SizedBox(height: 20),
        _Location(),
        SizedBox(height: 20),
        _ChangePassword(),
        SizedBox(height: 20),
        _SaveButton(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/core/services/service_locator.dart';
import 'package:sakeny/features/profile/edit_profile/controllers/edit_profile_cubit.dart';
import 'package:sakeny/utils/constants/const_text.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();
    return Hero(
      tag: "button",
      child: ElevatedButton(
        onPressed: editProfileCubit.save,
        child: Text(ConstText.save),
      ),
    );
  }
}
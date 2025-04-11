part of '../edit_profile_screen.dart';

class _ProfilePicture extends StatelessWidget {
  const _ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color scaffoldBackgroundColor = theme.scaffoldBackgroundColor;
    return Center(
      child: SizedBox(
        width: 130,
        height: 130,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 65,
              backgroundColor: scaffoldBackgroundColor,
              child: ClipOval(
                child: Image.asset(
                  ConstImages.profilePic,
                  fit: BoxFit.cover,
                  width: 130,
                  height: 130,
                  cacheWidth: 260,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add_a_photo_outlined,
                  size: 20,
                  color: scaffoldBackgroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  const _FirstName({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return NameTextField(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      label: ConstText.firstName,
      nameController: editProfileCubit.firstNameController,
    );
  }
}

class _SecondName extends StatelessWidget {
  const _SecondName({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return NameTextField(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      label: ConstText.secondName,
      nameController: editProfileCubit.secondNameController,
    );
  }
}

class _PhoneNumber extends StatelessWidget {
  const _PhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return PhoneTextField(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      label: ConstText.phoneNumber,
      phoneController: editProfileCubit.phoneNumberController,
    );
  }
}

class _Location extends StatelessWidget {
  const _Location({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return SelectLocation(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      label: ConstText.location,
      isPhoneValid: editProfileCubit.isPhoneNumberValid,
      phoneValidator: editProfileCubit.firstNameValidator,
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return EmailTextField(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      emailController: editProfileCubit.emailController,
    );
  }
}

class _ChangePassword extends StatelessWidget {
  const _ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstColors.primaryColor.withAlpha(210),
      ),
      child: const Text(ConstText.changePassword),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return ElevatedButton(
      onPressed: editProfileCubit.save,
      child: const Text(ConstText.save),
    );
  }
}

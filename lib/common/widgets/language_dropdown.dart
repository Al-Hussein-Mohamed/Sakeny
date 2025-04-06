import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> _lang = ['English', 'العربية'];

class LanguageDropdown extends StatelessWidget {
  const LanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: 180.r,
      child: CustomDropdown(
        // hintText: "Language",
        closedHeaderPadding: EdgeInsets.all(12.r),
        itemsListPadding: EdgeInsets.all(8.r),
        listItemPadding: EdgeInsets.all(8.r),
        decoration: CustomDropdownDecoration(
          closedBorder: Border.all(color: Colors.white, width: 2.h),
          closedBorderRadius: BorderRadius.circular(10.r),
          closedShadow: [
            const BoxShadow(
              color: Colors.black38,
              offset: Offset(-2, 5),
              blurRadius: 10,
            )
          ],
          prefixIcon: const Icon(Icons.language),
          expandedShadow: [
            const BoxShadow(
              color: Colors.black38,
              offset: Offset(-2, 5),
              blurRadius: 10,
            )
          ],
          listItemStyle: theme.textTheme.titleSmall,
          headerStyle: theme.textTheme.titleSmall,
        ),
        initialItem: _lang[0],
        items: _lang,
        onChanged: (lang) {},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class ProfileAlertBox extends StatelessWidget {
  final String content;
  final String actionButtonText;
  final Function? onpressed;
  ProfileAlertBox(
      {super.key,
      required this.content,
      required this.actionButtonText,
      this.onpressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: appcolor.primaryColor,
      content: Text(
        content,
        style: FontStyles.SmallTextFont(),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: FontStyles.SmallTextFont(),
            )),
        TextButton(
            onPressed: () async {
              if (onpressed != null) {
                await onpressed!();
              }
            },
            child: Text(
              actionButtonText,
              style: FontStyles.SmallTextFont(),
            )),
      ],
    );
  }
}

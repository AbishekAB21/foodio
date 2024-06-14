import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foodio/admin/provider/product_provider.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class DeleteDialog extends StatefulWidget {
  final String documentId;
  final String category; // Add category parameter
  final Function onDeleted;

  DeleteDialog({
    required this.documentId,
    required this.category, // Add category parameter
    required this.onDeleted,
  });

  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appcolor.backgroundColor,
      title: Text("Are you sure you want to delete this item?", style: FontStyles.SemiBoldTextStyle(),),
      content: Text("This action cannot be undone.", style: FontStyles.WarningTextFont(),),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog without doing anything
            },
            child: Text("Cancel", style: FontStyles.SmallTextFont(),)),
        TextButton(
            onPressed: () {
              final provider = Provider.of<ProductProvider>(context, listen: false);
              provider.deleteProduct(widget.documentId, widget.category).then((_) {
                widget.onDeleted();
                Navigator.pop(context); // Close the dialog after deletion
              }).catchError((e) {
                print('Error deleting document: $e');
              });
            },
            child: Text("Delete", style: FontStyles.WarningTextFont(),))
      ],
    );
  }
}

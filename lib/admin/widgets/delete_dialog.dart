import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodio/utils/app_colors.dart';
import 'package:foodio/utils/font_styles.dart';

class DeleteDialog extends StatefulWidget {
  final String documentId;
  final Function onDeleted;

  DeleteDialog({required this.documentId, required this.onDeleted});

  @override
  _DeleteDialogState createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  final TextEditingController categoryController = TextEditingController();

  Future<void> _deleteDocument(String documentId, String collectionName) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(documentId)
          .delete();
      print('Document deleted successfully');
      widget.onDeleted();
      Navigator.pop(context); // Close the dialog after deletion
    } catch (e) {
      print('Error deleting document: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Please enter the category of the item that you selected"),
      content: TextField(
        controller: categoryController,
        style: TextStyle(fontFamily: "Poppins", color: appcolor.secondaryColor),
        decoration: InputDecoration(
            hintText: "Category Name", hintStyle: FontStyles.lightTextStyle()),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog without doing anything
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              String categoryName = categoryController.text.trim();
              if (categoryName.isNotEmpty) {
                _deleteDocument(widget.documentId, categoryName);
              }
            },
            child: Text("Delete"))
      ],
    );
  }
}

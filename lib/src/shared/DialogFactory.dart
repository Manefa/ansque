import 'package:flutter/material.dart';

class DialogFactory {
  static bool _isDialogOpened = false;

  static showLoadingDialog({String? message, required BuildContext context}) async {
    DialogFactory._isDialogOpened = true;
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () => Future.value(false),
          child: AlertDialog(
            content: Row(
              children: [
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.0,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(message ?? "Merci de patienter...")),
              ],
            ),
          ),
        );
      },
    );
  }

  static hideDialog(BuildContext context) {
    if (DialogFactory._isDialogOpened) {
      DialogFactory._isDialogOpened = false;
      Navigator.of(context).pop();
    }
  }
}

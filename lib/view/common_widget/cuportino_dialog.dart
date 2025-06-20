import 'package:flutter/cupertino.dart';

void showCustomAlertDialog({
  required BuildContext context,
  String titleText = 'Alert',
  String contentText = 'Proceed with destructive action?',
  String cancelText = 'No',
  String confirmText = 'Yes',
  VoidCallback? onCancel,
  VoidCallback? onConfirm,
  bool isDestructive = true,
  bool isDefaultCancel = true,
}) {
  showCupertinoDialog<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: Text(titleText),
      content: Text(contentText),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: isDefaultCancel,
          onPressed: () {

            onCancel?.call();
          },
          child: Text(cancelText),
        ),
        CupertinoDialogAction(
          isDestructiveAction: isDestructive,
          onPressed: () {

            onConfirm?.call();
          },
          child: Text(confirmText),
        ),
      ],
    ),
  );
}

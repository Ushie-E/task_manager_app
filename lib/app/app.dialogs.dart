// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/error/error_dialog.dart';

enum DialogType {
  error,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.error: (context, request, completer) =>
        ErrorDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

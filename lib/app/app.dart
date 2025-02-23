import 'package:task_manager_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:task_manager_app/ui/bottom_sheets/alert/alert_sheet.dart';
import 'package:task_manager_app/ui/dialogs/error/error_dialog.dart';
import 'package:task_manager_app/services/task_service.dart';
import 'package:task_manager_app/services/notification_service.dart';
import 'package:task_manager_app/ui/views/task_list/task_list_view.dart';
import 'package:task_manager_app/ui/views/task_forms/task_forms_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    AdaptiveRoute(page: StartupView, initial: true),
    CustomRoute(page: TaskListView),
    CustomRoute(
      page: TaskFormsView,
      path: ':task',
    ),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: TaskService),
    LazySingleton(classType: NotificationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: AlertSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: ErrorDialog),
// @stacked-dialog
  ],
)
class App {}

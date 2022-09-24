import 'package:push_from_background/notifications.dart';
import "package:workmanager/workmanager.dart";

const onesTaskUniqId = "OnesNotificationTask";
const periodicTaskUniqId = "PeriodicNotificationTask";

Future<void> initialize() async {
  await Workmanager().initialize(callbackDispatcher);
}

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    await NotificationApi.showNotification(
      title: "",
      body: 'Уведомление в ${DateTime.now().toString()}',
    );

    return Future.value(true);
  });
}

Future<void> registerOnesNotificationTask() async {
  print("registerOnesNotificationTask");

  await Workmanager().registerOneOffTask(onesTaskUniqId, "OnesNotificationTaskName",
    constraints: Constraints(networkType: NetworkType.connected, ),
    initialDelay: const Duration(seconds: 15),
    existingWorkPolicy: ExistingWorkPolicy.replace
  );
}

Future<void> registerPeriodicNotificationTask() async {
  await Workmanager().registerPeriodicTask(periodicTaskUniqId, "PeriodicNotificationTaskName",
    frequency: const Duration(minutes: 2),
    existingWorkPolicy: ExistingWorkPolicy.replace
  );
}

Future<void> cancelTasks() async {
  await Workmanager().cancelByUniqueName(onesTaskUniqId);
  await Workmanager().cancelByUniqueName(periodicTaskUniqId);
}

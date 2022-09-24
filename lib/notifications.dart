import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class NotificationApi {
  static const channelId = "push_from_background channelId";
  static const channelName = "push_from_background channelName";
  static const channelDescription = "push_from_background channelDescription";
  static const insistentFlag = 4;

  static final notifications = FlutterLocalNotificationsPlugin()
    ..initialize(const InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
        iOS: IOSInitializationSettings()
    ));

  static Future<void> showNotification({
      String? title,
      String? body,
      }) async =>
    await notifications.show(
        0,
        title ?? "Уведомление",
        body ?? "Текст уведомления",
        _platformNotificationDetails);

  static NotificationDetails get _platformNotificationDetails => NotificationDetails(
      android: _androidNotificationDetails
  );

  static AndroidNotificationDetails get _androidNotificationDetails =>
      AndroidNotificationDetails(channelId, channelName,
          channelDescription: channelDescription,
          importance: Importance.max,
          priority: Priority.max,
          ticker: "ticker",
          additionalFlags: Int32List.fromList(<int>[insistentFlag])
      );
}
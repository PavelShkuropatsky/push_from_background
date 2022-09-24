import 'package:flutter/material.dart';
import 'package:push_from_background/work_manager.dart' as workmanager_api;

import '../notifications.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.schedule),
        title: const Text("Отправка уведомлений"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async => await NotificationApi.showNotification(),
              child: const Text("Отправить уведомление немедленно"),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              onPressed: () async => await workmanager_api.initialize(),
              child: const Text("Запустить фоновую службу")
            ),
            ElevatedButton(
              onPressed: () async => await workmanager_api.registerOnesNotificationTask(),
              child: const Text("Отправить уведомление в фоне"),
            ),
            ElevatedButton(
              onPressed: () async => await workmanager_api.registerPeriodicNotificationTask(),
              child: const Text("Запланировать уведомления в фоне"),
            ),
            ElevatedButton(
              onPressed: () async => await workmanager_api.cancelTasks(),
              child: const Text("Отменить запланированные уведомления"),
            ),
          ],
        ),
      ),
    );
  }
}

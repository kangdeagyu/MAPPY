import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationVm extends GetxController with WidgetsBindingObserver {
  // 알람 스위치 상태관리
  RxBool isNotificationMode = false.obs;

  // 알람
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void onInit() {
    super.onInit();
    loadNotificationMode();
    initializeNotifications();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  // 앱 상태에 따른 알람 설정
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setNotification();
    }
  }

  // 알람 초기화
  Future<void> initializeNotifications() async {
    tz.initializeTimeZones();
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings(
            "@mipmap/notification_icon"); // 아이콘 알람

    DarwinInitializationSettings iosInitializationSettings =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);

    setNotification();
  }

  static Future<PermissionStatus> checkNotificationPermissionStatus() async {
    final status = await Permission.notification.status;
    return status;
  }

  // 앱 상태 확인 후 알림
  Future<void> setNotification() async {
    var permissionStatus = await checkNotificationPermissionStatus();

    if (permissionStatus == PermissionStatus.granted) {
      isNotificationMode.value = true;
      scheduleNotification();
    } else {
      var result = await requestNotificationPermission();
      if (result) {
        isNotificationMode.value = true; // 사용자가 권한을 허용했을 때
        scheduleNotification();
      } else {
        isNotificationMode.value = false; // 사용자가 권한을 거부했을 때
      }
    }
  }

  Future<bool> requestNotificationPermission() async {
    var status = await Permission.notification.status;
    if (!status.isGranted) {
      status = await Permission.notification.request();
    }
    return status.isGranted;
  }

  // 알람 초기화
  Future<void> scheduleNotification() async {
    if (!isNotificationMode.value) {
      return;
    }

    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
      enableLights: false,
      enableVibration: true,
      playSound: true,
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(badgeNumber: 1),
    );

    flutterLocalNotificationsPlugin.zonedSchedule(0, '좋은 아침입니다.!',
        '활기찬 하루를 보내길 바랄게요!', makeDate(8, 0, 0), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);

    flutterLocalNotificationsPlugin.zonedSchedule(1, '하루 잘 보내셨나요?',
        '오늘 하루도 고생 많았어요!', makeDate(20, 0, 0), notificationDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  makeDate(hour, min, sec) {
    var now = tz.TZDateTime.now(tz.local);
    var when =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, min, sec);
    if (when.isBefore(now)) {
      return when.add(const Duration(days: 1));
    } else {
      return when;
    }
  }

  // 테스트
  Future<void> showNowNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
      enableLights: false,
      enableVibration: true,
      playSound: true,
      showWhen: false,
    );

    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: DarwinNotificationDetails(badgeNumber: 1),
    );

    await flutterLocalNotificationsPlugin.show(
        3, '알람 테스트', '알람이 켜졌습니다!', notificationDetails);
  }

  // 스위치 변경시 실행
  toggleNotification() async {
    var permissionStatus = await checkNotificationPermissionStatus();
    if (permissionStatus.isDenied) {
      await requestNotificationPermission();
    }
    isNotificationMode.value = !isNotificationMode.value;
    saveNotificationMode(isNotificationMode.value);
    if (isNotificationMode.value) {
      showNowNotification();
      //scheduleNotification(); // 실제 적용 될 알람
    } else {
      cancelNotification();
    }
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  // shared preferences 불러오기
  Future<void> saveNotificationMode(bool mode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notificationMode', mode);
  }

  // shard preferences 저장
  Future<void> loadNotificationMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isNotificationMode.value = prefs.getBool('notificationMode') ?? false;
  }
}

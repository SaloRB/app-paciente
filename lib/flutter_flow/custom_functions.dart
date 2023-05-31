import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String? formatDate(
  DateTime? date,
  bool getHour,
  bool getDate,
  bool getFullDate,
) {
  if (date == null) {
    return null;
  }

  DateFormat formatter;

  if (getHour == true) {
    formatter = DateFormat('HH:mm');
  } else if (getDate == true) {
    formatter = DateFormat('dd-MM-yyyy');
  } else if (getFullDate == true) {
    formatter = DateFormat('dd-MM-yyyy HH:mm');
  } else {
    formatter = DateFormat('dd-MM-yyyy HH:mm');
  }

  final String formatted = formatter.format(date);

  return formatted;
}

String relativeTime(String? convertDate) {
  if (convertDate == null) {
    return "time not listed";
  }

  final date = DateTime.parse(convertDate);

  return timeago.format(date, allowFromNow: true, locale: 'es');
}

bool isInLessThanAWeek(DateTime date) {
  final now = DateTime.now();
  final differenceInDays = date.difference(now).inDays;
  return differenceInDays >= 0 && differenceInDays < 7;
}

bool isInLessThanXHours(
  DateTime date,
  int hours,
) {
  final now = DateTime.now();
  final differenceInHours = date.difference(now).inHours;
  return differenceInHours >= 0 && differenceInHours < hours;
}

bool hasTimePassed(DateTime date) {
  final now = DateTime.now();
  final differenceInHours = date.difference(now).inHours;
  return differenceInHours < 0;
}

DateTime getTomorrow() {
  final now = DateTime.now();
  final tomorrow = DateTime(now.year, now.month, now.day + 1);
  return tomorrow;
}

DateTime getToday() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  return today;
}

List<dynamic>? getUserMedicaments(String userId) {
  return [
    {
      "medicamentId": "1",
      "name": "Omeprazol",
      "qty": "20 mg",
      "form": "Cápsula",
      "frequency": "Cada 4 horas",
      "duration": "2 semanas",
      "route": "Oral",
      "taken": false,
    },
    {
      "medicamentId": "2",
      "name": "Aspirina",
      "qty": "500 mg",
      "form": "Tableta",
      "frequency": "Cada 6 horas",
      "duration": "1 semana",
      "route": "Oral",
      "taken": false
    },
    {
      "medicamentId": "3",
      "name": "Alopurinol",
      "qty": "300 mg",
      "form": "Tableta",
      "frequency": "Una vez al día",
      "duration": "1 mes",
      "route": "Oral",
      "taken": false
    },
    {
      "medicamentId": "4",
      "name": "Paracetamol",
      "qty": "500 mg",
      "form": "Tableta",
      "frequency": "Cada 4 horas",
      "duration": "6 meses",
      "route": "Oral",
      "taken": false
    },
    {
      "medicamentId": "5",
      "name": "Simvastatina",
      "qty": "20 mg",
      "form": "Tableta",
      "frequency": "Una vez al día",
      "duration": "6 semanas",
      "route": "Oral",
      "taken": false
    },
  ];
}

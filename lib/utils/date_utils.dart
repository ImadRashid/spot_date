
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtils {

  // get age from DOB from MYsql date format
  static int getAgeFromDob(String birthDateString) {
    String datePattern = "yyy-MM-dd";

    DateTime birthDate = DateFormat(datePattern).parse(birthDateString);
    DateTime today = DateTime.now();

    int yearDiff = today.year - birthDate.year;

    return yearDiff;
  }

  // get relative date in string (Today, Yersterday, This week etc)
  static String getRelativeDate(String dateString) {
    String datePattern = "yyy-MM-dd";
    DateTime date = DateFormat(datePattern).parse(dateString);
    DateTime now = DateTime.now();

    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (date == today) {
      return "Today";
    }else if (date == yesterday) {
      return "Yesterday";
    }else if (now.difference(date).inDays < 7) {
      return "This Week";
    }else if (now.difference(date).inDays < 30) {
      return "This Month";
    }else if (now.difference(date).inDays < 365) {
      return "This year";
    }else {
      return "Older";
    }
  }

  // check current time is within start and close time
  static isInTime(String startTime, String closeTime) {
    String datePattern = "yyy-MM-dd HH:mm:ss";
    DateTime startDate = DateFormat(datePattern).parse(startTime);
    DateTime endDate = DateFormat(datePattern).parse(closeTime);
    TimeOfDay start = TimeOfDay(hour: startDate.hour, minute: startDate.minute);
    TimeOfDay close = TimeOfDay(hour: endDate.hour, minute: endDate.minute);
    TimeOfDay now = TimeOfDay.now();

    int startMins = (start.hour * 60) + start.minute;
    int closeMins = (close.hour * 60) + close.minute;
    int nowMins = (now.hour * 60) + now.minute;
    bool cond1 = nowMins >= startMins;
    bool cond2 = nowMins < closeMins;

    return (cond1 & cond2);
  }

  static getTime(String time) {
    String datePattern = "yyy-MM-dd HH:mm:ss";
    DateTime startDate = DateFormat(datePattern).parse(time);
    return "${startDate.hour}:${startDate.minute}";
  }

  static toDateTime(String dateString) {
    String datePattern = "yyy-MM-dd";
    DateTime date = DateFormat(datePattern).parse(dateString);
    return date;
  }
}
import 'package:flutter/foundation.dart';

/// --------------  Non-nullable helpers -----------------

int safeInt(dynamic value, [int fallback = 0]) {
  if (value is int) return value;
  if (value is double) return value.toInt();
  if (value is String) return int.tryParse(value) ?? fallback;
  return fallback;
}

double safeDouble(dynamic value, [double fallback = 0.0]) {
  if (value is double) return value;
  if (value is int) return value.toDouble();
  if (value is String) return double.tryParse(value) ?? fallback;
  return fallback;
}

bool safeBool(dynamic value, [bool fallback = false]) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final s = value.trim().toLowerCase();
    if (s == 'true' || s == '1') return true;
    if (s == 'false' || s == '0') return false;
  }
  return fallback;
}

String safeString(dynamic value, [String fallback = '']) {
  return value?.toString() ?? fallback;
}

DateTime safeDateTime(dynamic value, [DateTime? fallback]) {
  if (value is DateTime) return value;
  if (value is String) {
    final parsed = DateTime.tryParse(value);
    if (parsed != null) return parsed;
  }
  if (value is int || value is double) {
    return DateTime.fromMillisecondsSinceEpoch((value as num).toInt());
  }
  return fallback ?? DateTime(1970);
}

/// --------------  Nullable helpers (optional) -----------------

int? safeIntOrNull(dynamic value) {
  if (value is int) return value;
  if (value is String) return int.tryParse(value);
  return null;
}

double? safeDoubleOrNull(dynamic value) {
  if (value is double) return value;
  if (value is String) return double.tryParse(value);
  return null;
}

bool? safeBoolOrNull(dynamic value) {
  if (value is bool) return value;
  if (value is num) return value != 0;
  if (value is String) {
    final s = value.trim().toLowerCase();
    if (s == 'true' || s == '1') return true;
    if (s == 'false' || s == '0') return false;
  }
  return null;
}

String? safeStringOrNull(dynamic value) {
  return value?.toString();
}

DateTime? safeDateTimeOrNull(dynamic value) {
  if (value is DateTime) return value;
  if (value is String) return DateTime.tryParse(value);
  if (value is int || value is double) {
    return DateTime.fromMillisecondsSinceEpoch((value as num).toInt());
  }
  return null;
}

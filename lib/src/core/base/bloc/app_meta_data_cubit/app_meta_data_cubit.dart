import 'dart:async';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:bloc/bloc.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:stackfood/src/core/utils/utils.dart';

part 'app_meta_data_state.dart';

/// Cubit responsible for managing application metadata.
///
/// This cubit handles the retrieval and storage of various device and
/// application
/// information, such as device ID, OS type and version, app version, and build
/// number.
class AppMetaDataCubit extends Cubit<AppMetaDataState> {
  AppMetaDataCubit() : super(const AppMetaDataInitial());

  Completer<void>? _initCompleter;

  /// Initializes and populates the metadata.
  ///
  /// This method should be called after the `runApp` function in the `main`
  /// function.
  /// It can be called multiple times to re-populate the metadata if needed.
  ///
  /// Important: See https://pub.dev/packages/package_info_plus for more
  /// information on timing constraints for package info retrieval.
  Future<void> init() async {
    if (_initCompleter == null) {
      _initCompleter = Completer<void>();
      unawaited(_init());
    }
    return _initCompleter!.future;
  }

  Future<void> _init() async {
    emit(const AppMetaDataLoading());

    try {
      final deviceId = await _getDeviceId();

      String osType = '';
      String osVersion = '';

      if (kIsWeb) {
        osType = 'Web';
        osVersion = 'N/A';
      } else {
        osType = Platform.operatingSystem;
        osVersion = Platform.operatingSystemVersion;
      }

      final packageInfo = await PackageInfo.fromPlatform();
      final appVersion = packageInfo.version;
      final buildNumber = packageInfo.buildNumber;

      emit(
        AppMetaDataLoaded(
          deviceId: deviceId ?? '',
          osType: osType,
          osVersion: osVersion,
          appVersion: appVersion,
          buildNumber: buildNumber,
          isFirstTimer: null,
        ),
      );
    } catch (error, stackTrace) {
      Log.error('Error while initializing AppMetaDataCubit: $error');
      emit(AppMetaDataLoadingFailed(error: error, stackTrace: stackTrace));
    } finally {
      _initCompleter!.complete();
      _initCompleter = null;
    }
  }

  /// Retrieves the device's unique ID.
  ///
  /// Returns the device unique id for iOS and Android platforms.
  /// Returns null if the platform is not supported or if the ID can't be
  /// determined.

  Future<String?> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();

    if (kIsWeb) {
      return null;
    } else if (Platform.isIOS) {
      return (await deviceInfo.iosInfo).identifierForVendor;
    } else if (Platform.isAndroid) {
      return const AndroidId().getId();
    } else {
      return null;
    }
  }
}

import 'package:package_info_plus/package_info_plus.dart';

import '../util/Log.dart';

class Global {
  static late PackageInfo packageInfo;

  static init() async {
    packageInfo = await PackageInfo.fromPlatform();
    Log.i("appName: ${packageInfo.appName}, "
        "packageName: ${packageInfo.packageName}, "
        "version: ${packageInfo.version}, "
        "buildNumber: ${packageInfo.buildNumber}"
    );
  }
}

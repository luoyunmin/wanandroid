import 'package:flutter_gen/gen_l10n/wan_android_localizations.dart';

enum ArchitectureTab{
  architecture,
  navigation;

  String displayName(WanAndroidLocalizations local) {
    switch(this) {
      case ArchitectureTab.architecture:
        return local.architecture;
      case ArchitectureTab.navigation:
        return local.navigation;
    }
  }
}
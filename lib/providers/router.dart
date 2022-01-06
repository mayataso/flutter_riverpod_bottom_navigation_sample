import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:riverpod_bottomnav/providers/bottom_navigator.dart';

final routerProvider = Provider((_) => _Router());

class _Router {
  final Map<String, WidgetBuilder> pushRoutes = {
    BottomNavigationBarView.routeName: (_) => BottomNavigationBarView(),
  };

  Route onGenerateRoute(RouteSettings settings) {
    final pushPage = pushRoutes[settings.name]!;
    return MaterialPageRoute<void>(
      settings: settings,
      builder: pushPage,
    );
  }
}

String pascalCaseFromRouteName(String name) => name.substring(1).pascalCase;

@immutable
class PageInfo {
  PageInfo({
    required this.routeName,
    String? pageName,
    this.subTitle,
  }) : pageName = pageName ?? pascalCaseFromRouteName(routeName);

  final String routeName;
  final String pageName;
  final String? subTitle;

  static List<PageInfo> get all => [
        ...[
          BottomNavigationBarView.routeName,
        ].map((rn) => PageInfo(routeName: rn)),
      ];
}

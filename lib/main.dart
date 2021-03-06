import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'utils/util.dart';

void main() async {
  // main内で非同期処理するための記述
  WidgetsFlutterBinding.ensureInitialized();

  // 縦向き固定
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(
    // 下位ツリーでProviderを使用するためのラッパ
    const ProviderScope(
      overrides: [],
      observers: [
        _ProviderObserver(),
      ],
      child: App(),
    ),
  );
}

@immutable
class _ProviderObserver implements ProviderObserver {
  const _ProviderObserver();

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.info('provider: $provider, value: $value, container: $container');
  }

  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer containers,
  ) {
    logger.info('provider: $provider');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.info('provider: $provider, newValue: $newValue, container: $container');
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    logger.info('provider: $provider, error: $error, container: $container');
    logger.info('stackTrace: $stackTrace');
  }
}

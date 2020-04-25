import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assets_path_resolver/assets_path_resolver.dart';

void main() {
  const MethodChannel channel = MethodChannel('assets_path_resolver');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await AssetsPathResolver.platformVersion, '42');
  });
}

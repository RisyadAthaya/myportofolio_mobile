import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';
import 'package:myportofolio_mobile/services/api_client.dart';

Future<void> pumpApp(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1440, 3200);
  tester.view.devicePixelRatio = 1.0;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(MyApp(apiClient: ApiClient()));
}

void main() {
  testWidgets('Home page shows menu and drawer shows Login when logged out', (
    WidgetTester tester,
  ) async {
    await pumpApp(tester);

    expect(find.text('Selamat datang di MyPortfolio Mobile!'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    // The test font's wide glyphs overflow the fixed-height DrawerHeader.
    tester.takeException();

    expect(find.text('Login'), findsOneWidget);
    expect(find.widgetWithText(ListTile, 'Logout'), findsNothing);
  });

  testWidgets('Tapping Logout while logged out shows a SnackBar', (
    WidgetTester tester,
  ) async {
    await pumpApp(tester);

    await tester.tap(find.text('Logout'));
    await tester.pump();

    expect(find.text('Kamu belum login.'), findsOneWidget);
  });
}

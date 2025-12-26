import 'package:celoe/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ProfileScreen displays user info and options', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    // Verify Title
    expect(find.text('Profil Saya'), findsOneWidget);

    // Verify User Info
    expect(find.text('Mahasiswa Telkom'), findsOneWidget);
    expect(find.text('123456789 (NIM)'), findsOneWidget);

    // Verify Sections
    expect(find.text('Informasi Pribadi'), findsOneWidget);
    expect(find.text('Pengaturan'), findsOneWidget);

    // Verify Logout Button
    expect(find.text('Keluar'), findsOneWidget);
  });
}

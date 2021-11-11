import 'package:binary_calculator/ui/app.dart';
import 'package:binary_calculator/ui/widgets/bin2dec.dart';
import 'package:binary_calculator/ui/widgets/dec2bin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Binary to Decimal', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Bin2Dec())));

    expect(find.text('0'), findsNWidgets(3));
    expect(find.byKey(const Key('1')), findsOneWidget);
    expect(find.byKey(const Key('0')), findsOneWidget);

    await tester.tap(find.byKey(const Key('1')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('1')));
    await tester.pump();

    expect(find.text('11'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset')));
    await tester.pump();
    expect(find.text('0'), findsNWidgets(3));
  });

  testWidgets('Decimal to Binary', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: Dec2Bin())));

    expect(find.text('0'), findsNWidgets(3));
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);

    await tester.tap(find.byKey(const Key("1")));
    await tester.pump();
    await tester.tap(find.byKey(const Key("2")));
    await tester.pump();

    expect(find.text('12'), findsOneWidget);
    expect(find.text('1100'), findsOneWidget);

    await tester.tap(find.byKey(const Key('reset')));
    await tester.pump();
    expect(find.text('0'), findsNWidgets(3));
  });

  testWidgets('Switch widgets', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('0'), findsNWidgets(3));
    expect(find.byKey(const Key("1")), findsOneWidget);
    expect(find.byKey(const Key("0")), findsOneWidget);
    expect(find.byKey(const Key("2")), findsNothing);

    await tester.tap(find.byKey(const Key("switch")));
    await tester.pump();

    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
  });
}

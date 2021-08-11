import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test/image.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets(
    'should show the beach',
    (tester) async {
      await mockNetworkImagesFor(() => _createWidget(tester));

      final image = find.byWidgetPredicate((widget) => widget is Image);
      final text = find.text('Vamos para o rio!');

      expect(image, findsOneWidget);
      expect(text, findsOneWidget);
    },
  );
}

Future<void> _createWidget(WidgetTester tester) async {
  await tester.pumpWidget(
    const MaterialApp(
      home: ImageTest(),
    ),
  );

  await tester.pump();
}

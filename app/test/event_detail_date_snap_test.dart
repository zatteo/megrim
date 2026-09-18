import 'package:flutter_test/flutter_test.dart';
import 'package:megrim/screens/event_detail_screen.dart';

void main() {
  group('snapEndToStart', () {
    final end = DateTime(2026, 9, 18, 14, 0);
    final newStart = DateTime(2026, 9, 17, 8, 0);

    test('snaps end to the new start when neither date was touched', () {
      expect(
        snapEndToStart(
          currentEnd: end,
          startTouched: false,
          endTouched: false,
          newStart: newStart,
        ),
        newStart,
      );
    });

    test('leaves end unchanged once the start has already been touched', () {
      expect(
        snapEndToStart(
          currentEnd: end,
          startTouched: true,
          endTouched: false,
          newStart: newStart,
        ),
        end,
      );
    });

    test('leaves end unchanged once the end has already been touched', () {
      expect(
        snapEndToStart(
          currentEnd: end,
          startTouched: false,
          endTouched: true,
          newStart: newStart,
        ),
        end,
      );
    });

    test('leaves a null (ongoing) end unchanged', () {
      expect(
        snapEndToStart(
          currentEnd: null,
          startTouched: false,
          endTouched: false,
          newStart: newStart,
        ),
        isNull,
      );
    });
  });
}

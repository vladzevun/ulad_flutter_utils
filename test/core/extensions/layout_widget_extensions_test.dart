import 'package:flutter/material.dart';
import 'package:flutter_common_utils/src/core/extensions/layout_widget_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LayoutWidgetX', () {
    group('splitWith', () {
      test('adds separator between widgets', () {
        final widgets = [const Text('A'), const Text('B'), const Text('C')];
        final separator = const SizedBox(width: 8);
        final result = widgets.splitWith(separator);

        // leading + A + sep + B + sep + C + trailing = 7
        expect(result.length, 7);
      });

      test('no leading spacing', () {
        final widgets = [const Text('A'), const Text('B')];
        final separator = const SizedBox(width: 8);
        final result = widgets.splitWith(separator, isLeadingSpacing: false);

        // A + sep + B + trailing = 4
        expect(result.length, 4);
      });

      test('no trailing spacing', () {
        final widgets = [const Text('A'), const Text('B')];
        final separator = const SizedBox(width: 8);
        final result = widgets.splitWith(separator, trailingSpacing: false);

        // leading + A + sep + B = 4
        expect(result.length, 4);
      });

      test('single widget', () {
        final widgets = [const Text('A')];
        final separator = const SizedBox(width: 8);
        final result = widgets.splitWith(separator);

        // leading + A + trailing = 3
        expect(result.length, 3);
      });

      test('empty list', () {
        final widgets = <Widget>[];
        final separator = const SizedBox(width: 8);
        final result = widgets.splitWith(separator);

        // leading + trailing = 2
        expect(result.length, 2);
      });

      test('uses leadingSpacing when provided', () {
        final widgets = [const Text('A')];
        final separator = const SizedBox(width: 8);
        final leading = const SizedBox(width: 16);
        final result = widgets.splitWith(separator, leadingSpacing: leading);

        expect(result.first, leading);
        expect(result.last, leading);
      });
    });
  });
}

# flutter_common_utils

A collection of reusable Flutter widgets, extensions, cubits and UI helpers.

## Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_common_utils:
    git:
      url: https://github.com/vladzevun/flutter_common_utils.git
```

## What's inside

### Core

**Either** — a simple `Either<L, R>` type for error handling without exceptions.

```dart
final result = Either.createRight<String, int>(42);
result.fold(
  (error) => print('Error: $error'),
  (value) => print('Value: $value'),
);

// Convenience
final fallback = result.getOrElse(() => 0);
final mapped = result.map((v) => v * 2);
```

**Text styles** — pre-defined `TextStyle` constants: `ts12w400`, `ts16w600`, `ts24w700`, etc. Pattern: `ts{size}w{weight}`.

**Spacing** — `SizedBox` and `EdgeInsets` shortcuts using `flutter_screenutil`:

```dart
spacingV8   // SizedBox(height: 8.h)
spacingH16  // SizedBox(width: 16.w)
edgeInsetsH16  // EdgeInsets.symmetric(horizontal: 16.w)
borderR8    // BorderRadius.all(Radius.circular(8.r))
```

### Extensions

| Extension | On | Methods |
|---|---|---|
| `BuildContextX` | `BuildContext` | `colorScheme`, `theme`, `iconColor`, `screenUtil` |
| `StringX` | `String` | `nullIfEmptyOrWhiteSpace`, `commasToDots`, `capitalizeFirst`, `formatNumberWithSpaces`, `toNewLines` |
| `StringXNullable` | `String?` | `isNullOrEmpty` |
| `ListX<T>` | `List<T>` | `isFirst`, `isLast`, `containsAtLeastOne`, `splitBy` |
| `LayoutWidgetX` | `List<Widget>` | `splitWith` — inserts separators between widgets |
| `DateTimeX` | `DateTime` | `toddMMyyyyDoted`, `toyyyyMMDDDashed`, `toHourString`, etc. |
| `DateFormatX` | `DateFormat` | `tryFormat` — null-safe formatting |
| `FormKeyX` | `GlobalKey<FormState>` | `validateForm` |
| `TextEditingControllerX` | `TextEditingController` | `selectAll` |

### Cubits

**PaginationCubit** — abstract cubit for paginated data loading. Override `getPage()` and get pagination, error handling and refresh for free.

```dart
class ItemsCubit extends PaginationCubit<Item> {
  @override
  Future<Either<String?, List<Item>>> getPage({
    required int page,
    required int pageSize,
    String? filter,
  }) async {
    return api.getItems(page: page, pageSize: pageSize);
  }
}
```

**SingleRequestCubit** — same pattern for a single data fetch. Override `getData()`.

**EventState** — `initial`, `loading`, `data`, `error` with boolean getters.

### Widgets

| Widget | Description |
|---|---|
| `PaginationItemsV` | ListView with built-in pagination via `PaginationCubit` |
| `SliverPaginationItemsV` | Same but as slivers in a `CustomScrollView` |
| `PrimarySRCV` | Builder widget for `SingleRequestCubit` (loading/error/data states) |
| `InkButton` | Material button with `InkWell` + `Ink` decoration |
| `InkCard` | Tappable card with Material ink effect |
| `HorizontalCardsV` | Horizontal scrollable row of cards with spacing |
| `PrimaryPaddingColumn` | Column with default horizontal padding |
| `TitledColV` | Title + value in a column |
| `TitledRowV` | Title + value in a row |
| `TitledColumn` / `TitledRow` | Title + list of children |
| `RowItemV` | Key-value row with flexible layout |
| `PrimaryLoading` | Centered `CircularProgressIndicator` |
| `PaginationEndLoading` | Loading indicator at the bottom of a paginated list |
| `PaginationEmptyV` | Empty state placeholder |
| `PaginationErrorV` / `TryAgainV` | Error states with retry button |
| `ErrorImage` | Error placeholder for images |
| `ErrorDialog` / `showErrorDialog` | Alert dialog for errors |
| `showErrorSnackBar` | SnackBar helper |

## Example

See the [example](example/) directory for a runnable demo app covering all features.

## Dependencies

- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [intl](https://pub.dev/packages/intl)

## License

MIT

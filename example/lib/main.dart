import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common_utils/flutter_common_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Common Utils Example',
          theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Common Utils')),
      body: ListView(
        children: [
          _SectionTile(
            title: 'Either',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const EitherExamplePage()),
            ),
          ),
          _SectionTile(
            title: 'Extensions',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ExtensionsExamplePage()),
            ),
          ),
          _SectionTile(
            title: 'Widgets',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WidgetsExamplePage()),
            ),
          ),
          _SectionTile(
            title: 'Pagination Cubit',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const PaginationExamplePage()),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _SectionTile({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

// --- Either Example ---

class EitherExamplePage extends StatelessWidget {
  const EitherExamplePage({super.key});

  Either<String, int> divide(int a, int b) {
    if (b == 0) return Either.createLeft('Division by zero');
    return Either.createRight(a ~/ b);
  }

  @override
  Widget build(BuildContext context) {
    final success = divide(10, 2);
    final failure = divide(10, 0);

    return Scaffold(
      appBar: AppBar(title: const Text('Either Example')),
      body: PrimaryPaddingColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spacingV16,
          Text('divide(10, 2):', style: ts16w600),
          Text(
            success.fold(
              (error) => 'Error: $error',
              (value) => 'Result: $value',
            ),
            style: ts14w400,
          ),
          spacingV16,
          Text('divide(10, 0):', style: ts16w600),
          Text(
            failure.fold(
              (error) => 'Error: $error',
              (value) => 'Result: $value',
            ),
            style: ts14w400,
          ),
          spacingV16,
          Text('getOrElse:', style: ts16w600),
          Text(
            'failure.getOrElse(() => -1) = ${failure.getOrElse(() => -1)}',
            style: ts14w400,
          ),
          spacingV16,
          Text('map:', style: ts16w600),
          Text(
            'success.map((v) => v * 10) = ${success.map((v) => v * 10).right}',
            style: ts14w400,
          ),
        ],
      ),
    );
  }
}

// --- Extensions Example ---

class ExtensionsExamplePage extends StatelessWidget {
  const ExtensionsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Extensions Example')),
      body: PrimaryPaddingColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          spacingV16,
          Text('StringX', style: ts18w600),
          spacingV8,
          RowItemV.flex(
            title: "'hello'.capitalizeFirst",
            value: Text('hello'.capitalizeFirst),
          ),
          spacingV4,
          RowItemV.flex(
            title: "'1000000'.formatNumberWithSpaces",
            value: Text('1000000'.formatNumberWithSpaces),
          ),
          spacingV4,
          RowItemV.flex(
            title: "'1,5'.commasToDots",
            value: Text('1,5'.commasToDots),
          ),
          spacingV16,
          Text('ListX', style: ts18w600),
          spacingV8,
          RowItemV.flex(
            title: '[1,2,3].isFirst(1)',
            value: Text('${[1, 2, 3].isFirst(1)}'),
          ),
          spacingV4,
          RowItemV.flex(
            title: '[1,2,3].isLast(3)',
            value: Text('${[1, 2, 3].isLast(3)}'),
          ),
          spacingV4,
          RowItemV.flex(
            title: '[1,2,3,4,5].splitBy(2)',
            value: Text('${[1, 2, 3, 4, 5].splitBy(2)}'),
          ),
          spacingV16,
          Text('StringXNullable', style: ts18w600),
          spacingV8,
          RowItemV.flex(
            title: "null.isNullOrEmpty",
            value: Text('${(null as String?).isNullOrEmpty}'),
          ),
          spacingV4,
          RowItemV.flex(
            title: "'text'.isNullOrEmpty",
            value: Text('${'text'.isNullOrEmpty}'),
          ),
          spacingV16,
          Text('Context Extensions', style: ts18w600),
          spacingV8,
          Builder(
            builder: (ctx) => Text(
              'Theme brightness: ${ctx.theme.brightness}',
              style: ts14w400,
            ),
          ),
        ],
      ),
    );
  }
}

// --- Widgets Example ---

class WidgetsExamplePage extends StatelessWidget {
  const WidgetsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets Example')),
      body: SingleChildScrollView(
        child: PrimaryPaddingColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            spacingV16,
            Text('TitledColV', style: ts18w600),
            spacingV8,
            TitledColV.text('Label', 'Value text'),
            spacingV16,
            Text('TitledRowV', style: ts18w600),
            spacingV8,
            TitledRowV(
              title: Text('Title:', style: ts14w600),
              value: Text('Value', style: ts14w400),
            ),
            spacingV16,
            Text('RowItemV', style: ts18w600),
            spacingV8,
            RowItemV(
              title: Text('Name', style: ts14w400),
              value: Text('John Doe', style: ts14w600),
            ),
            spacingV16,
            Text('PrimaryLoading', style: ts18w600),
            spacingV8,
            const SizedBox(height: 60, child: PrimaryLoading()),
            spacingV16,
            Text('PaginationEmptyV', style: ts18w600),
            spacingV8,
            const SizedBox(height: 60, child: PaginationEmptyV()),
            spacingV16,
            Text('PaginationErrorV', style: ts18w600),
            spacingV8,
            SizedBox(height: 100, child: PaginationErrorV(onTap: () {})),
            spacingV16,
            Text('InkButton', style: ts18w600),
            spacingV8,
            InkButton.normalText(
              title: 'Button',
              onTap: () => showErrorDialog(context, text: 'Dialog shown!'),
            ),
            spacingV16,
            Text('ErrorSnackbar', style: ts18w600),
            spacingV8,
            InkButton.normalText(
              title: 'Show Snackbar',
              onTap: () => showErrorSnackBar(context, text: 'Example error'),
            ),
            spacingV24,
          ],
        ),
      ),
    );
  }
}

// --- Pagination Example ---

class _ItemCubit extends PaginationCubit<String> {
  _ItemCubit() : super(pageSize: 10, startingIndex: 0);

  @override
  Future<Either<String?, List<String>>> getPage({
    required int page,
    required int pageSize,
    String? filter,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (page >= 30) {
      return Either.createRight([]);
    }
    final items = List.generate(pageSize, (i) => 'Item ${page + i + 1}');
    return Either.createRight(items);
  }
}

class PaginationExamplePage extends StatelessWidget {
  const PaginationExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _ItemCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Pagination Example')),
        body: PaginationItemsV<String, _ItemCubit>(
          onSelect: (item) {},
          valueSearchField: (item) => item,
          itemBuilder: (item, isSelected) =>
              ListTile(title: Text(item), selected: isSelected),
        ),
      ),
    );
  }
}

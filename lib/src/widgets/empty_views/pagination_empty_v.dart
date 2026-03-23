import 'package:flutter/material.dart';

class PaginationEmptyV extends StatelessWidget {
  final String? text;

  const PaginationEmptyV({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    //TODO: add localization
    return Center(
      child: Text(
        text ?? 'Пусто',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  factory PaginationEmptyV.noFilterData() {
    return PaginationEmptyV(
      text: 'Данных для фильтра нет',
    ); // TODO: add localization
  }
}

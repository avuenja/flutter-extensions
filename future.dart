import 'package:flutter/material.dart';

extension FutureValueBuilder<T> on Future<T> {
  when({
    required Widget Function() loading,
    required Widget Function(Object? error, StackTrace? stackTrace) error,
    required Widget Function(T? data) data,
  }) {
    return FutureBuilder<T>(
      future: this,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return data(snapshot.data);
        } else if (snapshot.hasError) {
          return error(snapshot.error, snapshot.stackTrace);
        } else {
          return loading();
        }
      },
    );
  }
}

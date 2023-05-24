// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConnectivityController on ConnectivityControllerBase, Store {
  Computed<bool>? _$isConnectionNotEmptyComputed;

  @override
  bool get isConnectionNotEmpty => (_$isConnectionNotEmptyComputed ??=
          Computed<bool>(() => super.isConnectionNotEmpty,
              name: 'ConnectivityControllerBase.isConnectionNotEmpty'))
      .value;

  late final _$connectivityResultAtom = Atom(
      name: 'ConnectivityControllerBase.connectivityResult', context: context);

  @override
  ConnectivityResult get connectivityResult {
    _$connectivityResultAtom.reportRead();
    return super.connectivityResult;
  }

  @override
  set connectivityResult(ConnectivityResult value) {
    _$connectivityResultAtom.reportWrite(value, super.connectivityResult, () {
      super.connectivityResult = value;
    });
  }

  late final _$ConnectivityControllerBaseActionController =
      ActionController(name: 'ConnectivityControllerBase', context: context);

  @override
  Stream<ConnectivityResult> getConnectionStatus() {
    final _$actionInfo = _$ConnectivityControllerBaseActionController
        .startAction(name: 'ConnectivityControllerBase.getConnectionStatus');
    try {
      return super.getConnectionStatus();
    } finally {
      _$ConnectivityControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connectivityResult: ${connectivityResult},
isConnectionNotEmpty: ${isConnectionNotEmpty}
    ''';
  }
}

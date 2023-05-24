import 'package:flutter/material.dart';

abstract class Exeption {}

class RequisitionError implements Exeption {
  RequisitionError(this.message) {
    debugPrint(message);
  }

  final String message;
}

class TimeOutError implements Exception {
  TimeOutError(this.message) {
    debugPrint(message);
  }

  final String message;
}

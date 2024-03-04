import 'package:flutter/material.dart';

Text textWidget({required String text}) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }
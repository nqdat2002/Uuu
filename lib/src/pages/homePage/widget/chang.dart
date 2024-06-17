import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> incrementReadCount(String email, String category) async {
  final url = Uri.parse('https://recommendationsys-djkh.onrender.com/increment_read_count');
  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode({
      'email': email,
      'category': category,
    }),
  );

  if (response.statusCode == 200) {
    if (kDebugMode) {
      print('Read count incremented successfully');
    }
  } else {
    if (kDebugMode) {
      print('Failed to increment read count: ${response.body}');
    }
  }
}

import 'package:app_dieta/app.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://yjvhwusnzerwiecphcth.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoiYW5vbiIsImlhdCI6MTYzNzM0MzEwNiwiZXhwIjoxOTUyOTE5MTA2fQ.-R8PTZGPjfRpYc5kFmV8xvF0z5os7NXpF3WevNMia7o',
  );
  
  runApp(const App());
}
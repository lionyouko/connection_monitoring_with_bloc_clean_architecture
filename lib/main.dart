import 'package:connection_monitoring_with_bloc_clean_architecture/di/service_locator.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/presentation/widgets/connectivity_awareness_wrapper_widget.dart';
import 'package:connection_monitoring_with_bloc_clean_architecture/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConnectivityAwarenessWrapperWidget(
      child: MaterialApp(
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}

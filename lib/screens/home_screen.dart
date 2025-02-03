import 'package:connection_monitoring_with_bloc_clean_architecture/feature_connectivity/presentation/widgets/connectivity_awareness_informative_widget.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text('Home Screen')),
        ConnectivityAwarenessInformativeWidget(),
      ],
    );
  }
}

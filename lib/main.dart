import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snowcast/core/app/app.dart';
import 'package:snowcast/core/di/injection_container.dart';
import 'package:snowcast/core/theme/gradient_cubit/gradient_cubit.dart';
import 'package:snowcast/features/localization/presentation/bloc/locale_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GradientCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<LocaleCubit>(),
        ),
      ],
      child: const App(),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/core/constant/firebase_api.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/todo/data/repository/todos_repository_impl.dart';
import 'features/todo/presentation/provider/todos_provider.dart';
import 'features/todo/presentation/screens/not_compelted_task_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseApi().initNotifications();

  // final notificationService = NotificationService();
  // await notificationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(
          create: (_) => TodosProvider(
            todosRepository: TodosRepositoryImpl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        navigatorKey: navigatorKey,
        routes: {
          InCompletedTodos.route: (context) => InCompletedTodos(),
        },
        home: const LoginScreen(),
      ),
    );
  }
}

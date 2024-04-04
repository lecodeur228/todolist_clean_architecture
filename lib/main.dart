import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_clean_architecture/features/todolist/presentation/pages/task_screen.dart';
import 'package:todolist_clean_architecture/features/todolist/presentation/providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ToDoList Clean Archi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TaskProvider()),
          ],
          child: const Home(),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void didChangeDependencies() {
    Provider.of<TaskProvider>(context, listen: false).eitherFailureOrTasks();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const TaskScreen();
  }
}


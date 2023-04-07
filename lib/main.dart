import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordpress/core/services/service_locator.dart';
import 'package:wordpress/core/observer.dart';
import 'package:wordpress/features/posts/presentation/controller/cubit/post_cubit.dart';
import 'package:wordpress/features/posts/presentation/controller/cubit/post_state.dart';
import 'package:wordpress/features/posts/presentation/pages/posts.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>sl<PostsCubit>()..getAllPosts(),
      child: BlocConsumer<PostsCubit,PostsState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: PostsScreen(),
          );
        },
      ),
    );
  }
}



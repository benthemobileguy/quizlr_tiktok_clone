import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizlr_tiktok_clone/core/services/services_locator.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/following_cubit.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/for_you_cubit.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/cubit/reveal_answer_cubit.dart';
import 'package:quizlr_tiktok_clone/features/home/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context){
          return FollowingCubit();
        }),
         BlocProvider(create: (context){
          return ForYouCubit();
        },),
         BlocProvider(create: (context){
          return RevealAnswerCubit();
        },),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TikTok',
          theme: ThemeData(
            fontFamily: 'SfProRounded',
            primarySwatch: Colors.blue,
          ),
          home: const HomePage()),
    );
  }
}

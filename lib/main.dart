import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfajriansyah_flutter_test/blocs/post/post_bloc.dart';
import 'package:mfajriansyah_flutter_test/screens/post.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Test',
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(
              create: (context) => PostBloc()..add(LoadEvent()),
            ),
          ],
          child: const PostPage(),
        ));
  }
}

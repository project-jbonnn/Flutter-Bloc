import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfajriansyah_flutter_test/blocs/post/post_bloc.dart';

import '../components/loading.dart';

class DetailPost extends StatelessWidget {
  final int id;
  const DetailPost({ 
    Key? key,
    required this.id
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(context),
      body: widgetBody()
    );
  }

  getAppbar(BuildContext context) => AppBar(
    title: const Text('Postingan'),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      }, 
      icon: const Icon(
        Icons.arrow_back,
      )
    ),
  );

  Widget widgetBody() => BlocProvider<PostBloc>(
    create: (context) => PostBloc()..add(GetIdEvent(id: id)),
    child: SafeArea(
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    state.postModel!.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(state.postModel!.body),
                ],
              ),
            );
          } else if (state is FailedLoadState) {
            return Center(
              child: Text(state.error),
            );
          }
          return const WidgetPostLoading();
        },
      )
    ),
  );
}
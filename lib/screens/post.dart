import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mfajriansyah_flutter_test/components/card.dart';

import '../blocs/post/post_bloc.dart';
import '../components/loading.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(),
      body: widgetBody(),
    );
  }

  getAppbar() => AppBar(
    title: const Text('Postingan'),
    centerTitle: true,
  );

  Widget widgetBody() => SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return RefreshIndicator(
              onRefresh: () async => context.read<PostBloc>().add(PullToRefreshEvent()),
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final posts = state.posts[index];
                  return PostCard(
                    id: posts.id,
                    title: posts.title, 
                    body: posts.body
                  );
                }
              ),
            );
          } else if (state is FailedLoadState) {
            return Center(
              child: Text(state.error),
            );
          }
          return ListView.builder(
            itemCount: 7,
            itemBuilder: (context, index) => const WidgetPostLoading()
          );
        },
      ),
    ),
  );
}
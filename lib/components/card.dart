import 'package:flutter/material.dart';
import 'package:mfajriansyah_flutter_test/screens/detail_post.dart';
import 'package:page_transition/page_transition.dart';

class PostCard extends StatelessWidget {
  final int id;
  final String title;
  final String body;
  const PostCard({
    Key? key,
    required this.id,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context, 
          PageTransition(
            type: PageTransitionType.bottomToTop,
            child: DetailPost(id: id),
          )
        );
      },
      child: SizedBox(
        height: 120,
        width: double.infinity,
        child: Card(
          elevation: 8.0,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  body, 
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

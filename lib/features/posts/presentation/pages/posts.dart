import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wordpress/core/resources/assets_manager.dart';
import 'package:wordpress/core/resources/color_manager.dart';
import 'package:wordpress/core/resources/values_manager.dart';
import 'package:wordpress/features/posts/domain/entities/posts.dart';
import 'package:wordpress/features/posts/presentation/controller/cubit/post_cubit.dart';
import 'package:wordpress/features/posts/presentation/controller/cubit/post_state.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PostsCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => BuildContent(
                      article: cubit.posts[index],
                    ),
                    itemCount: cubit.posts.length,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class BuildContent extends StatelessWidget {
  final Article article;

  const BuildContent({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: CachedNetworkImage(
            width: double.infinity,
            //height: 170.0,
            imageUrl: ImageAssets.katyPerry,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.grey[400]!,
              child: Container(
                height: 200.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Image(
              width: 550,
              height: 270,
              color: ColorManager.sWhite,
              image: AssetImage(
                ImageAssets.person,
              ),
            ),
          ),
        ),
        // const Image(
        //   width: double.infinity,
        //   height: AppSize.s200,
        //   image: NetworkImage(
        //     ImageAssets.katyPerry,
        //   ),
        // ),
        Html(
          data: article.content,
          onLinkTap: (url, context, attributes, element) {
            launchUrlString(article.link);
          },
        )
      ],
    );
  }
}

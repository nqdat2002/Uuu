import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuu/src/commonWidget/customWidget.dart';
import 'package:uuu/src/models/newsResponseModel.dart';
import 'package:uuu/src/pages/homePage/bloc/bloc.dart';
import 'package:uuu/src/theme/theme.dart';

import 'bloc/bloc.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  Widget _headerNews(BuildContext context, Article article) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Hero(
          tag: 'headerImage',
          child: article.urlToImage == null || article.urlToImage!.isEmpty
              ? Container()
              : customImage(article.urlToImage.toString()),
        ),
        Container(
          padding: const EdgeInsets.only(left: 0, right: 10, bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.keyboard_backspace,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Theme.of(context).colorScheme.background,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.share,
                  color: Theme.of(context).colorScheme.background,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _body(BuildContext context, Article article) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: _headerNews(context, article),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Text(article.title.toString(), style: AppTheme.h1Style),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text(article.author ?? '', style: AppTheme.h6Style),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(article.getTime(), style: AppTheme.h6Style),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 1,
              ),
              Text(article.content ?? '', style: AppTheme.h4Style)
            ],
          ),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SafeArea(child: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            if (state == null) {
              return const Center(child: Text('Null bloc'));
            }
            if (state is Failure) {
              return const Center(child: Text('Something went wrong'));
            }
            if (state is LoadedArticle) {
              if (state.selectedArticle == null) {
                return const Text('No content available');
              } else {
                return _body(
                  context,
                  state.selectedArticle,
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
        )
    );
  }
}

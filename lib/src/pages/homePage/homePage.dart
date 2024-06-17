import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuu/src/commonWidget/customWidget.dart';
import 'package:uuu/src/models/newsResponseModel.dart';
import 'package:uuu/src/pages/newsDetail/bloc/bloc.dart';
import 'package:uuu/src/theme/theme.dart';
import 'bloc/bloc.dart';
import 'widget/newsCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget _headerNews(Article article) {
    return Builder(
      builder: (context) {
        return InkWell(
            onTap: ()  {

              final detailBloc = BlocProvider.of<DetailBloc>(context);
              detailBloc.add(SelectNewsForDetail(article: article));
              Navigator.pushNamed(context, '/detail');
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Hero(
                  tag: 'headerImage',
                  child: article.urlToImage == null
                      ? Container()
                      : customImage(article.urlToImage.toString()),
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 10, bottom: 20, top: 20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black, Colors.transparent],
                      // stops: [.1, .9],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(article.title.toString(),
                          style: AppTheme.h4Style.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface)),
                      Text(
                        article.getTime(),
                        style: AppTheme.subTitleStyle.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      )
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }

  Widget _body(
    BuildContext context,
    List<Article> list, {
    required String type,
  }) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          centerTitle: true,
          title: Text(
            '${type.toUpperCase()} NEWS',
            style: AppTheme.h2Style
                .copyWith(color: Theme.of(context).colorScheme.inversePrimary),
          ),
          backgroundColor: Theme.of(context).bottomAppBarColor,
          pinned: true,
        ),
        SliverToBoxAdapter(
          child: _headerNews(list.first),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => NewsCard(
                      artical: list[index],
                      type: type.toUpperCase(),
                    ),
                childCount: list.length))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        statusBarColor: Theme.of(context).colorScheme.background));
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state == null) {
              return const Center(child: Text('Null block'));
            }
            if (state is Failure) {
              return const Center(child: Text('Something went wrong'));
            }
            if (state is Loaded) {
              if (state.items == null || state.items.isEmpty) {
                return const Text('No content available');
              } else {
                return _body(context, state.items, type: state.type);
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

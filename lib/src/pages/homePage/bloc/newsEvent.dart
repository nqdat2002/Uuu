import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{
  const NewsEvent();

  @override
  List<Object> get props => [];
}
class Fetch extends NewsEvent {
  final String type;

  const Fetch({required this.type});

  @override
  List<Object> get props => [type];

  @override
  String toString() => 'Fetch $type news';
}

class FetchMixedNews extends NewsEvent {
  final List<String> categories;

  const FetchMixedNews({required this.categories});

  @override
  List<Object> get props => [categories];
}
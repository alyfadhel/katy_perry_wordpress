import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final int id;
  final String title;
  final String content;
  final String link;

  const Article({
    required this.id,
    required this.title,
    required this.content,
    required this.link,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    content,
    link,
  ];
}

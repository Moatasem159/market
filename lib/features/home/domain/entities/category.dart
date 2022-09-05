import 'package:equatable/equatable.dart';

class Category extends Equatable{
  const Category({
    this.id,
    this.name,
    this.image,
  });

  final int ?id;
  final String? name;
  final String ?image;

  @override
  List<Object?> get props => [id,name,image];
}
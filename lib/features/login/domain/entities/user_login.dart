import 'package:equatable/equatable.dart';

class User extends Equatable{

  final String? name;
  final String ?email;
  final String ?phone;
  final int ?id;
  final String ?image;
  final String ?token;
  final int ?points;
  final int ?credit;


  const User({
    this.points,
    this.credit,
    this.token,
    this.name,
    this.email,
    this.phone,
    this.id,
    this.image});

  @override
  List<Object?> get props => [];
}
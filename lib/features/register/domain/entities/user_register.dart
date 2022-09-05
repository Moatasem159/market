import 'package:equatable/equatable.dart';

class UserRegister extends Equatable{

 final String? name;
 final String ?email;
 final String ?phone;
 final int ?id;
 final String ?image;
 final String ?token;


 const UserRegister({
   this.token,
   this.name,
   this.email,
   this.phone,
   this.id,
   this.image});

  @override
  List<Object?> get props => [];
}
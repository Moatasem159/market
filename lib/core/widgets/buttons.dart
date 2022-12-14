import 'package:flutter/material.dart';
import 'package:supermarket/core/utils/app_colors.dart';


class MainButton extends StatelessWidget {

  final  VoidCallback? onPressed;
  final String label;
  const MainButton({Key? key, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius:BorderRadius.circular(28.5),
          )),
          backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
          fixedSize: MaterialStateProperty.all(const Size(150, 57))
      ),
      onPressed:onPressed,
      child: Text(label,style: Theme.of(context).textTheme.subtitle1!.copyWith(
        color: Colors.white,
        fontSize: 15,
      ),),
    );

  }
}







class MainBackButton extends StatelessWidget {
  final  VoidCallback? onPressed;

  const MainBackButton({Key? key,this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.of(context).pop();
    },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
        minimumSize: MaterialStateProperty.all(const Size(34,34)),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius:BorderRadius.circular(10),
        )),
        shadowColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Icon(Icons.arrow_back_ios_rounded,color:Theme.of(context).iconTheme.color,size: 14,),
    );
  }
}
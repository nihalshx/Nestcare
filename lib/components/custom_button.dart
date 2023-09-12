import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget buttonText;
  final Function() onpressed;

  // ignore: use_key_in_widget_constructors
  const CustomButton({
    required this.buttonText,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 319,
      height: 49,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
              color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
        ],

        color: Colors.black,
        borderRadius: BorderRadius.circular(9),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          // elevation: MaterialStateProperty.all(3),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
        ),
        onPressed: () {
          onpressed();
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child:buttonText,
        ),
      ),
    );
  }
}

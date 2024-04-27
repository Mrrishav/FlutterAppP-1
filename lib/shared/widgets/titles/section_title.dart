import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title,
  required this.action, required this.onPressed,
  
  });

  final String title;
  final String? action;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    //Create the HomeView UI
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
        style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        if (action != null) 
        TextButton(
          onPressed: onPressed,
          child: Text
          (action!,
          style: textTheme.bodyMedium!
              .copyWith(decoration: TextDecoration.underline,
              color: Colors.red,)
          ),
        ),
      ],
    );
  }
} 
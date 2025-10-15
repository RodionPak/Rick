import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/detail_character_bloc.dart';
import '../widget/custom_expansion_tile.dart';

class TitleDescriptionWidgetMore extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleDescriptionWidgetMore({
    super.key,
    required this.title,
    required this.subtitle,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:30),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),Flexible(
            child: FittedBox(
              child: SingleChildScrollView(
                child: Container(
                  child: Text(
                    maxLines: 10,
                    subtitle,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
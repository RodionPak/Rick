import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/detail_character_bloc.dart';

class DetailScreenCharacter extends StatefulWidget {
  const DetailScreenCharacter({super.key});

  @override
  State<DetailScreenCharacter> createState() => _DetailScreenCharacterState();
}

class _DetailScreenCharacterState extends State<DetailScreenCharacter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCharacterBloc, DetailCharacterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 40,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: const Text(
              'All Characters',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 0.5,
              ),
            ),
          ),
          body: state is SuccessGetDetailCharacterState ?
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: Container(
                      width: double.infinity,
                      color: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.red,
                          child: Image.network(
                            fit: BoxFit.contain,
                            state.model.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TitleDescriptionWidget(title: 'Name:', subtitle: state.model.name),
                  TitleDescriptionWidget(title: 'Male:', subtitle: state.model.gender.name),
                  TitleDescriptionWidget(title: 'status:', subtitle:  state.model.status.name),
                  TitleDescriptionWidget(title: 'Location:', subtitle: state.model.location.name),
                  TitleDescriptionWidget(title: 'Created:', subtitle:DateFormat('dd MMM yyyy, HH:mm').format(state.model.created)),
                  TitleDescriptionWidgetMore(
                    title: 'Episodes:',
                    subtitle: state.model.episode.take(10).join('\n'),
                  ),



                ],
              ),
            ),
          ):Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
              backgroundColor: Colors.transparent,
              strokeWidth: 2.0,
            ),
          ),
        );
      },
    );
  }
}

class TitleDescriptionWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleDescriptionWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Flexible(
            child: FittedBox(
              child: Text(
                maxLines: 1,
                subtitle,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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

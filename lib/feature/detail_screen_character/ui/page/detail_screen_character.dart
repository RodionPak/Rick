import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../bloc/detail_character_bloc.dart';
import '../widget/TitleDescriptionWidget.dart';
import '../widget/custom_expansion_tile.dart';

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
            title:Text(
              state is SuccessGetDetailCharacterState
                  ? state.model.name // Показываем имя персонажа
                  : 'Loading...', // Пока данные загружаются
              style: const TextStyle(
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
                  CustomExpansionTile(
                    title: 'Episodes:',
                    itemCount: state.model.episode.length, // можно показать сколько эпизодов
                    children: state.model.episode.map((episodeUrl) {
                      return ListTile(
                        title: Text(
                          episodeUrl,
                          style: const TextStyle(fontSize: 14),
                        ),
                        onTap: () {
                          // 👇 здесь можно добавить навигацию к экрану эпизода
                          print('Tapped on episode: $episodeUrl');
                        },
                      );
                    }).toList(),
                  ),
                  TitleDescriptionWidget(title: 'Location:', subtitle: state.model.location.name),


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





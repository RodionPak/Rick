import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ricki/feature/app/routing/routing_path.dart';
import 'package:ricki/feature/detail_screen_character/ui/bloc/detail_character_bloc.dart';
import 'package:ricki/feature/home_page/ui/state/home_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomePageBloc>().add(GetDataCharacterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF0FFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white, // фиксированный цвет
        elevation: 4,
        toolbarHeight: 40,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<HomePageBloc, HomePageState>(
          builder: (context, state) {
            if (state is SuccessGetCharacterState) {
              return ListView.separated(
                itemCount: state.model.results.length,
                itemBuilder: (ctx, index) {
                  final character = state.model.results[index];
                  return InkWell(
                    onTap: () {
                      context.read<DetailCharacterBloc>().add(GetSingleCharacterEvent(id: character.id));
                      context.goNamed(RoutePath.detailCharacterPage);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            offset: Offset(3, 1),
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: Image.network(character.image),
                        title: Text(character.name),
                        subtitle: Text(character.species),
                        trailing: Icon(Icons.navigate_next),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

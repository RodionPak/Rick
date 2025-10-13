import 'package:go_router/go_router.dart';
import 'package:ricki/feature/app/routing/routing_path.dart' show RoutePath;
import 'package:ricki/feature/home_page/ui/page/home_page.dart';

import '../../detail_screen_character/ui/page/detail_screen_character.dart'
    show DetailScreenCharacter;

class RoutesInit {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: RoutePath.initPath,
        name: RoutePath.initPath,
        builder: (context, state) => HomePage(),
        routes: [
          GoRoute(
            path: RoutePath.detailCharacterPage,
            name: RoutePath.detailCharacterPage,
            builder: (context, state) => DetailScreenCharacter(),
          ),
        ],
      ),
    ],
  );
}

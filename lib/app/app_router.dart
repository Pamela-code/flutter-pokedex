import 'package:pokedex/modules/home/view/poke_list_view.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/modules/poke_details/view/poke_details_view.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const PokeListView()),
    GoRoute(
      path: '/details',
      builder: (context, state) {
        final url = state.extra as String? ?? '';
        return PokeDetailsView(url: url);
      },
    ),
  ],
);

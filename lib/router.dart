import 'package:cubit_example/counter/view/counter.detail.page.dart';
import 'package:cubit_example/counter/view/counter.page.dart';
import 'package:go_router/go_router.dart';

final routerDefinition = GoRouter(
  initialLocation: '/counter',
  routes: [
    GoRoute(
      path: '/',
      redirect: (_) => '/counter',
    ),
    GoRoute(
      name: 'counter',
      path: '/counter',
      builder: (_, GoRouterState state) => const CounterPage(),
      routes: [
        GoRoute(
          name: 'counter_detail',
          path: ':id',
          builder: (_, GoRouterState state) {
            int id = int.tryParse(state.params['id']!) ?? 0;
            return CounterDetailPage(id: id);
          },
        ),
      ],
    ),
  ],
);

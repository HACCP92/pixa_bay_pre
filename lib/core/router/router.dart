import 'package:go_router/go_router.dart';
import 'package:pixa_bay_pre/data/repository/pixabay_photo_repository_impl.dart';
import 'package:pixa_bay_pre/domain/model/photo.dart';
import 'package:pixa_bay_pre/presentation/detail/detail_screen.dart';
import 'package:pixa_bay_pre/presentation/main/main_screen.dart';
import 'package:pixa_bay_pre/presentation/main/main_view_model.dart';
import 'package:provider/provider.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/main',
  routes: [
    GoRoute(
      path: '/main',
      builder: (context, state) {
        return ChangeNotifierProvider(
          create: (_) => MainViewModel(PixabayPhotoRepositoryImpl()),
          child: const MainScreen(),
        );
      },
      routes: [
        GoRoute(
          path: 'detail',
          builder: (context, state) {
            final photo = state.extra as Photo;
            return DetailScreen(photo: photo);
          },
        ),
      ],
    ),
  ],
);

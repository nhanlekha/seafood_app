import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_app/domans/data_source/seafood_api.dart';
import 'package:seafood_app/domans/repo/cate_repo.dart';
import 'package:seafood_app/domans/repo/impl/cate_repo_impl.dart';
import 'package:seafood_app/domans/repo/impl/product_repo_impl.dart';
import 'package:seafood_app/domans/repo/impl/slide_repo_impl.dart';
import 'package:seafood_app/domans/repo/product_repo.dart';
import 'package:seafood_app/routers/app_route_config.dart';
import 'package:seafood_app/screens/page/main_screens/main_screens.dart';

import 'domans/repo/slide_repo.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("vi"), Locale("en")],
      path: "assets/translations",
      child: const SeafoodApp(),
    ),
  );
}

class SeafoodApp extends StatefulWidget {
  const SeafoodApp({super.key});

  @override
  State<SeafoodApp> createState() => _SeafoodAppState();
}

class _SeafoodAppState extends State<SeafoodApp> {
  late final SeafoodApi _seafoodApi;
  late final SlideRepo _slideRepo;
  late final CateRepo _cateRepo;
  late final ProductRepo _productRepo;

  @override
  void initState() {
    super.initState();
    // Initializing
    _seafoodApi = SeafoodApi();
    _slideRepo = SlideRepoImpl(seafoodApi: _seafoodApi);
    _cateRepo = CateRepoImpl(seafoodApi: _seafoodApi);
    _productRepo = ProductRepoImpl(seafoodApi: _seafoodApi);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SlideRepo>(create: (context) => _slideRepo),
        RepositoryProvider<CateRepo>(create: (context) => _cateRepo),
        RepositoryProvider<ProductRepo>(create: (context) => _productRepo),
      ],
      // child: BlocProvider(
      //   create: (context) => AppCubit(authRepo: _authRepo),
      //   child: SnapLinkRouter(),
      // ),
      child: const ApplicationRouter(),
    );
  }
}

class ApplicationRouter extends StatelessWidget {
  const ApplicationRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.returnRouter(),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnapLink Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: SafeArea(child: MainScreens()),
      ),
    );
  }
}

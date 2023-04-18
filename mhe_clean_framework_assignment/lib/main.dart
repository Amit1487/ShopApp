import 'package:clean_framework/clean_framework.dart';

import 'package:clean_framework_router/clean_framework_router.dart';
import 'package:flutter/material.dart';

import 'providers.dart';
import 'routing/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppProviderScope(
      externalInterfaceProviders: [
        shopAppExternalInterfaceProvider,
      ],
      child: AppRouterScope(
        create: ShopAppRouter.new,
        builder: (context) {
          return MaterialApp.router(
            title: 'Assignment',
            routerConfig: context.router.config,
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.white,
                brightness: Brightness.light,
              ),
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}

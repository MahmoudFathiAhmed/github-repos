import 'package:github_repo/app/app_export.dart';
import 'package:github_repo/core/utils/values_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: context.width > AppDouble.d600
            ? Size(context.width, context.height)
            : const Size(AppDouble.d360, AppDouble.d640),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
              title: StringsManager.appName,
              debugShowCheckedModeBanner: false,
              theme: getApplicationTheme(),
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.initialRoute,
            ));
  }
}

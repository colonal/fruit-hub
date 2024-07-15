import 'package:flutter_bloc/flutter_bloc.dart';

import '../helpers/logger.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    loggerNoStack.i('${bloc.runtimeType} was created.');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    loggerNoStack.i('${bloc.runtimeType} $event was added.');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    loggerNoStack.i('${bloc.runtimeType} $change was added.');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    loggerNoStack.i('${bloc.runtimeType} $transition was added.');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    loggerNoStack.i('${bloc.runtimeType} $error was thrown.');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    loggerNoStack.i('${bloc.runtimeType} was closed.');
  }
}

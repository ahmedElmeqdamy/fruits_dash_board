import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
//create blocObserver class to watch blocs 1-2
class BlocWatch extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('$change');



  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('$transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('$error');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('$bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('$event');
  }


}
import 'package:flutter_bloc/flutter_bloc.dart';

class GlobalRefreshCubit extends Cubit<bool> {
  GlobalRefreshCubit() : super(false);

  void refresh() {
    emit(true);
    emit(false);
  }
}
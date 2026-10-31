import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritCubit extends Cubit<Set<String>> {
  FavoritCubit() : super(const {});

  void tandai(String namaLayanan) {
    if (state.contains(namaLayanan)) return;
    emit({...state, namaLayanan});
  }

  void batalTandai(String namaLayanan) {
    if (!state.contains(namaLayanan)) return;
    emit(state.where((nama) => nama != namaLayanan).toSet());
  }
}

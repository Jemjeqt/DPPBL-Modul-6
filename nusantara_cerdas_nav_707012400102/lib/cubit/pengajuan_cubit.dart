import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_layanan.dart';

class PengajuanCubit extends Cubit<List<LayananPublik>> {
  PengajuanCubit() : super(const []);

  int get totalPengajuan => state.length;

  void ajukan(LayananPublik layanan) {
    if (state.any((diajukan) => diajukan.nama == layanan.nama)) return;
    emit([...state, layanan]);
  }

  void hapus(LayananPublik layanan) {
    emit(state.where((diajukan) => diajukan.nama != layanan.nama).toList());
  }
}

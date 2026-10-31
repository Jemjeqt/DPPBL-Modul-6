import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/data_laporan.dart';

class LaporanCubit extends Cubit<List<LaporanWarga>> {
  LaporanCubit() : super(DataLaporan.daftar);

  void tambahLaporan(LaporanWarga laporan) => emit([laporan, ...state]);
}

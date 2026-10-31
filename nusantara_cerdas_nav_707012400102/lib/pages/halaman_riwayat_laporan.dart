import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_theme.dart';
import '../cubit/laporan_cubit.dart';
import '../cubit/pengajuan_cubit.dart';
import '../data/data_laporan.dart';
import '../data/data_layanan.dart';

class HalamanRiwayatLaporan extends StatelessWidget {
  const HalamanRiwayatLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RIWAYAT LAPORAN', style: AppTheme.gayaEyebrow(context)),
      ),
      body: BlocBuilder<LaporanCubit, List<LaporanWarga>>(
        builder: (context, daftarLaporan) {
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            itemCount: daftarLaporan.length + 2,
            itemBuilder: (context, indeks) {
              if (indeks == 0) return const _BagianPengajuan();

              if (indeks == 1) {
                return Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 4),
                  child: Text(
                    'LAPORAN WARGA (${daftarLaporan.length})',
                    style: AppTheme.gayaEyebrow(context),
                  ),
                );
              }

              final indeksLaporan = indeks - 2;
              return _BarisLaporan(
                laporan: daftarLaporan[indeksLaporan],
                nomor: indeksLaporan + 1,
                garisBawah: indeksLaporan != daftarLaporan.length - 1,
              );
            },
          );
        },
      ),
    );
  }
}

class _BagianPengajuan extends StatelessWidget {
  const _BagianPengajuan();

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return BlocBuilder<PengajuanCubit, List<LayananPublik>>(
      builder: (context, daftar) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 4),
              child: Text(
                'PENGAJUAN LAYANAN (${daftar.length})',
                style: AppTheme.gayaEyebrow(context),
              ),
            ),
            if (daftar.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: skema.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: skema.outlineVariant),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.inbox_outlined,
                      size: 20,
                      color: skema.onSurfaceVariant,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Belum ada pengajuan. Buka tab Layanan lalu tekan '
                        '"Ajukan Permohonan".',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              )
            else
              Column(
                children: [
                  for (int i = 0; i < daftar.length; i++) ...[
                    if (i > 0) const Divider(height: 1),
                    _BarisPengajuan(
                      layanan: daftar[i],
                      garisBawah: i < daftar.length - 1,
                    ),
                  ],
                ],
              ),
          ],
        );
      },
    );
  }
}

class _BarisPengajuan extends StatelessWidget {
  const _BarisPengajuan({required this.layanan, required this.garisBawah});

  final LayananPublik layanan;
  final bool garisBawah;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 34,
                child: Icon(
                  Icons.description_outlined,
                  size: 20,
                  color: skema.secondary,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(layanan.nama, style: textTheme.titleMedium),
                    const SizedBox(height: 3),
                    Text(
                      layanan.dinas,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const _ChipStatus(status: StatusLaporan.diajukan),
              const SizedBox(width: 8),
              SizedBox(
                height: 32,
                width: 32,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 18,
                  tooltip: 'Batalkan pengajuan',
                  icon: const Icon(Icons.close),
                  color: skema.onSurfaceVariant,
                  onPressed: () {
                    context.read<PengajuanCubit>().hapus(layanan);
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        SnackBar(
                          content: Text(
                            'Pengajuan "${layanan.nama}" dibatalkan.',
                          ),
                        ),
                      );
                  },
                ),
              ),
            ],
          ),
        ),
        if (garisBawah) const Divider(height: 1),
      ],
    );
  }
}

class _BarisLaporan extends StatelessWidget {
  const _BarisLaporan({
    required this.laporan,
    required this.nomor,
    required this.garisBawah,
  });

  final LaporanWarga laporan;
  final int nomor;
  final bool garisBawah;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 34,
                child: Text(
                  '$nomor'.padLeft(2, '0'),
                  style: textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(laporan.judul, style: textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(laporan.tanggal, style: textTheme.bodyMedium),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _ChipStatus(status: laporan.status),
            ],
          ),
        ),
        if (garisBawah) const Divider(height: 1),
      ],
    );
  }
}

class _ChipStatus extends StatelessWidget {
  const _ChipStatus({required this.status});

  final StatusLaporan status;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final gelap = skema.brightness == Brightness.dark;

    final (Color warna, String label) = switch (status) {
      StatusLaporan.diajukan => (skema.secondary, 'Diajukan'),
      StatusLaporan.diproses => (skema.primary, 'Diproses'),
      StatusLaporan.selesai => (
        gelap ? const Color(0xFF81C784) : const Color(0xFF2E7D32),
        'Selesai',
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: warna.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: warna, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: warna,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

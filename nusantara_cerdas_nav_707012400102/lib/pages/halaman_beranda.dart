import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../navigation/app_routes.dart';

class HalamanBeranda extends StatelessWidget {
  const HalamanBeranda({super.key});

  static const List<_PilarKota> _pilar = [
    _PilarKota(
      judul: 'Smart Governance',
      deskripsi: 'Pemerintahan transparan dan responsif.',
      tag: 'Tata Kelola',
      ikon: Icons.account_balance_outlined,
    ),
    _PilarKota(
      judul: 'Smart Branding',
      deskripsi: 'Promosi wisata, budaya, dan ekonomi kota.',
      tag: 'Identitas',
      ikon: Icons.campaign_outlined,
    ),
    _PilarKota(
      judul: 'Smart Economy',
      deskripsi: 'Dukungan UMKM dan ekonomi digital.',
      tag: 'Ekonomi',
      ikon: Icons.storefront_outlined,
    ),
    _PilarKota(
      judul: 'Smart Living',
      deskripsi: 'Kesehatan, pendidikan, dan hunian layak.',
      tag: 'Kehidupan',
      ikon: Icons.holiday_village_outlined,
    ),
    _PilarKota(
      judul: 'Smart Society',
      deskripsi: 'Warga aman, inklusif, dan partisipatif.',
      tag: 'Masyarakat',
      ikon: Icons.diversity_3_outlined,
    ),
    _PilarKota(
      judul: 'Smart Environment',
      deskripsi: 'Lingkungan dan energi berkelanjutan.',
      tag: 'Lingkungan',
      ikon: Icons.eco_outlined,
    ),
  ];

  static const List<String> _hari = [
    'Senin',
    'Selasa',
    'Rabu',
    'Kamis',
    'Jumat',
    'Sabtu',
    'Minggu',
  ];
  static const List<String> _bulan = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember',
  ];

  String _sapaanWaktu() {
    final jam = DateTime.now().hour;
    if (jam >= 4 && jam < 11) return 'Selamat pagi';
    if (jam >= 11 && jam < 15) return 'Selamat siang';
    if (jam >= 15 && jam < 19) return 'Selamat sore';
    return 'Selamat malam';
  }

  String _tanggalHariIni() {
    final kini = DateTime.now();
    return '${_hari[kini.weekday - 1]}, ${kini.day} ${_bulan[kini.month - 1]} ${kini.year}';
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_sapaanWaktu()}, Warga'.toUpperCase(),
              style: AppTheme.gayaEyebrow(context),
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(text: 'Kota yang\nmelayani, '),
                  TextSpan(
                    text: 'setiap hari',
                    style: TextStyle(
                      color: skema.secondary,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
                style: textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 6),
            Text(_tanggalHariIni(), style: textTheme.bodyMedium),
            const SizedBox(height: 20),
            const _PanelBuatLaporan(),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _AksiCepat(
                    ikon: Icons.grid_view_outlined,
                    label: 'Semua Layanan',
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.daftarLayanan),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _AksiCepat(
                    ikon: Icons.history,
                    label: 'Laporan Saya',
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoutes.riwayatLaporan),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const _PitaStatusKota(),
            const SizedBox(height: 28),
            Text('ENAM PILAR KOTA', style: AppTheme.gayaEyebrow(context)),
            const SizedBox(height: 4),
            Column(
              children: [
                for (int i = 0; i < _pilar.length; i++) ...[
                  if (i > 0) const Divider(height: 1),
                  _BarisPilar(
                    pilar: _pilar[i],
                    nomor: i + 1,
                    onTap: () => _tampilkanPilar(context, _pilar[i]),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _tampilkanPilar(BuildContext context, _PilarKota pilar) {
    final skema = Theme.of(context).colorScheme;

    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: skema.surfaceContainerLow,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: skema.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(pilar.ikon, size: 20, color: skema.primary),
                ),
                const SizedBox(width: 12),
                Text(
                  pilar.judul,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(pilar.deskripsi, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 8),
            Text(
              'Salah satu dari enam pilar Kota Nusantara Cerdas yang menjadi '
              'arah pembangunan kota.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _PanelBuatLaporan extends StatelessWidget {
  const _PanelBuatLaporan();

  Future<void> _bukaFormulir(BuildContext context) async {
    final hasil = await Navigator.pushNamed(context, AppRoutes.formulirLaporan);
    if (!context.mounted) return;
    if (hasil is String) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(hasil)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return Material(
      color: skema.primary,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () => _bukaFormulir(context),
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: skema.onPrimary.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.edit_note, size: 24, color: skema.secondary),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Buat Laporan Baru',
                      style: TextStyle(
                        color: skema.onPrimary,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.5,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Laporkan masalah di sekitarmu ke pemerintah kota',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.5, color: skema.onPrimary),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_outward, size: 18, color: skema.secondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _PitaStatusKota extends StatelessWidget {
  const _PitaStatusKota();

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
      decoration: BoxDecoration(
        color: skema.inverseSurface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'STATUS LAYANAN'.toUpperCase(),
            style: TextStyle(
              fontSize: 11.5,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.6,
              color: skema.onInverseSurface.withValues(alpha: 0.55),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '24/7',
                      style: TextStyle(
                        fontSize: 40,
                        height: 1,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -1,
                        color: skema.onInverseSurface,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Akses layanan publik',
                      style: TextStyle(
                        fontSize: 12.5,
                        color: skema.onInverseSurface.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 44,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: skema.onInverseSurface.withValues(alpha: 0.18),
              ),
              const Expanded(
                flex: 3,
                child: _StatistikKecil(angka: '6', label: 'Pilar kota'),
              ),
              Container(
                width: 1,
                height: 44,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                color: skema.onInverseSurface.withValues(alpha: 0.18),
              ),
              const Expanded(
                flex: 3,
                child: _StatistikKecil(angka: '9', label: 'Layanan aktif'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatistikKecil extends StatelessWidget {
  const _StatistikKecil({required this.angka, required this.label});

  final String angka;
  final String label;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          angka,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: skema.secondary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.5,
            color: skema.onInverseSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

class _AksiCepat extends StatelessWidget {
  const _AksiCepat({required this.ikon, required this.label, this.onTap});

  final IconData ikon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;

    return Material(
      color: skema.surfaceContainerLow,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: skema.outlineVariant),
          ),
          child: Row(
            children: [
              Icon(ikon, size: 18, color: skema.primary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium
                      ?.copyWith(fontSize: 13.5),
                ),
              ),
              const Icon(Icons.chevron_right, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarisPilar extends StatelessWidget {
  const _BarisPilar({
    required this.pilar,
    required this.nomor,
    required this.onTap,
  });

  final _PilarKota pilar;
  final int nomor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 34,
              child: Text(
                '$nomor'.padLeft(2, '0'),
                style: textTheme.titleMedium?.copyWith(
                  color: skema.secondary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(pilar.judul, style: textTheme.titleMedium),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: skema.primary.withValues(alpha: 0.07),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          pilar.tag.toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.8,
                            color: skema.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(pilar.deskripsi, style: textTheme.bodyMedium),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_outward, size: 16),
          ],
        ),
      ),
    );
  }
}

class _PilarKota {
  const _PilarKota({
    required this.judul,
    required this.deskripsi,
    required this.tag,
    required this.ikon,
  });

  final String judul;
  final String deskripsi;
  final String tag;
  final IconData ikon;
}

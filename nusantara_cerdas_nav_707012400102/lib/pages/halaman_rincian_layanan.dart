import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../app_theme.dart';
import '../cubit/pengajuan_cubit.dart';
import '../data/data_layanan.dart';

class HalamanRincianLayanan extends StatefulWidget {
  const HalamanRincianLayanan({super.key, required this.layanan});

  final LayananPublik layanan;

  @override
  State<HalamanRincianLayanan> createState() => _HalamanRincianLayananState();
}

class _HalamanRincianLayananState extends State<HalamanRincianLayanan> {
  bool _sedangMengirim = false;

  Future<void> _ajukanPermohonan() async {
    setState(() => _sedangMengirim = true);

    await Future<void>.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    context.read<PengajuanCubit>().ajukan(widget.layanan);
    setState(() => _sedangMengirim = false);

    Navigator.pop(
      context,
      'Permohonan "${widget.layanan.nama}" telah diajukan.',
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final skema = Theme.of(context).colorScheme;
    final layanan = widget.layanan;

    return Scaffold(
      appBar: AppBar(
        title: Text('RINCIAN LAYANAN', style: AppTheme.gayaEyebrow(context)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: skema.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(layanan.ikon, size: 22, color: skema.primary),
              ),
              const SizedBox(height: 14),
              Text(layanan.nama, style: textTheme.headlineSmall),
              const SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: skema.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: skema.outlineVariant),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    _BarisInfo(
                      ikon: Icons.apartment_outlined,
                      label: 'DINAS PENANGGUNG JAWAB',
                      nilai: layanan.dinas,
                    ),
                    const Divider(height: 1, indent: 56),
                    _BarisInfo(
                      ikon: Icons.schedule_outlined,
                      label: 'JAM OPERASIONAL',
                      nilai: layanan.jam,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text('KETERANGAN', style: AppTheme.gayaEyebrow(context)),
              const SizedBox(height: 8),
              Text(layanan.keterangan, style: textTheme.bodyLarge),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _sedangMengirim ? null : _ajukanPermohonan,
                  child: _sedangMengirim
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Ajukan Permohonan'),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Kembali'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BarisInfo extends StatelessWidget {
  const _BarisInfo({
    required this.ikon,
    required this.label,
    required this.nilai,
  });

  final IconData ikon;
  final String label;
  final String nilai;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            ikon,
            size: 20,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: AppTheme.gayaEyebrow(context)),
                const SizedBox(height: 3),
                Text(nilai, style: textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

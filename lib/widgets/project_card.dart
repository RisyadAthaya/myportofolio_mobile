import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/screens/experience_form.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/project_list_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatelessWidget {
  final ItemHomepage item;

  const ItemCard(this.item, {super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _onTap(BuildContext context) async {
    if (item.name == "Lihat Proyek") {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const ProjectListScreen(),
        ),
      );
      return;
    }

    if (item.name == "Tambah Proyek") {
      if (!await ensureLoggedIn(context)) return;
      if (!context.mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute<void>(builder: (context) => const ProjectFormPage()),
      );
      return;
    }

    if (item.name == "Tambah Pengalaman") {
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (context) => const ExperienceFormPage(),
        ),
      );
      return;
    }

    if (item.name == "Logout") {
      final authState = context.read<AuthState>();
      if (!authState.isLoggedIn) {
        _showSnackBar(context, "Kamu belum login.");
        return;
      }
      await authState.logout();
      if (!context.mounted) return;
      _showSnackBar(context, "Kamu berhasil logout.");
      return;
    }

    _showSnackBar(context, "Kamu telah menekan tombol ${item.name}!");
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      // Menggunakan warna sekunder dari skema tema aplikasi.
      color: item.color ?? Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Aksi ketika kartu ditekan oleh pengguna. Area responsif terhadap sentuhan
        onTap: () => _onTap(context),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white, size: 30.0),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

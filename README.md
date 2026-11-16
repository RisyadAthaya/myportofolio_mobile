# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Tugas 7

1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak
   (parent-child) bekerja antar-widget!

Widget tree adalah struktur dari semua widget yang membentuk tampilan dari aplikasi Flutter.
Parent adalah widget yang membungkus widget-widget lain (yang berupa childnya). Dalam website,
mungkin bisa kita miripkan dengan div. Tetapi ada sedikit perbedaan, salah satunya adalah data dan
tema dari parent widget mengalir ke bawah ke child.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!

- MyHomePage = Widget custom untuk halaman utama
- Scaffold = Kerangka dasar halaman
- AppBar = Bar di bagian atas halaman
- Text = Menampilkan teks
- Padding = Ngasih jarak di sekeliling child
- Column = Nyusun child secara vertikal
- Row = Nyusun child secara horizontal
- SizedBox = Kasih jarak fixed antar-widget
- Center = Nempatin child di tengah
- GridView = Nampilin child dengan jumlah kolom tetap
- InfoCard = Kartu yang nampilin info tentang saya
- ItemCard = Kartu menu portofolio
- Card = Kartu
- Container = Wadah buat ngatur ukuran, dll
- Material = Menyediakan tampilan bergaya Material
- InkWell = Membuat area bisa ditekan
- Icon = Ikon
- SnackBar = Pesan yang muncul di bawah layar
- ScaffoldMessenger = Menampilkan SnackBar di Scaffold
- MaterialApp = Root widget

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root 
   widget pada aplikasi Flutter!

MaterialApp adalah widget yang membungkus aplikasi dan menyediakan konfigurasi design. Hal-hal
seperti tema, navigasi, dan lainnya diatur dalam widget ini sehingga dipakai sebagai root widget.

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih
   StatelessWidget dan kapan harus menggunakan StatefulWidget?

StatelessWidget bisa kita ibaratkan sebagai website dengan hanya html dan css (tidak persis, tapi
kurang lebih mirip). Jadi, setelah widgetnya dibuild, tidak ada lagi state yang berubah. Sedangkan,
StatefulWidget punya state yang bisa berubah selama aplikasi berjalan.

Pilih StatelessWidget ketika tampilannya statis atau bergantung hanya pada data eksternal. Pilih
StatefulWidget kalau tampilan perlu berubah karena interaksi pengguna atau data dinamis.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode
   build?

BuildContext adalah objek yang dapat diakses untuk melihat data apa saja yang bisa diakses oleh
sebuah widget. BuildContext bisa dibilang sebagai objek yang merepresentasikan posisi widget di
widget tree.

Penggunaannya berada di bagian build widget. Biasanya diakses dengan menggunakan metode of(),
seperti Theme.of(context).colorScheme.secondary.

6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak
   bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?

Hot reload mengapply kode yang baru diubah ke aplikasi yang sedang berjalan, membangun ulang widget
tree tanpa menghilangkan state aplikasi. Sedangkan, hot restart menjalankan ulang aplikasi dari
awal sehingga kode dikompilasi ulang dan semua state direset ke state awal.

Full restart benar-benar mematikan aplikasi sepenuhnya dan membangun ulang dari nol. Hot restart
diperlukan ketika ada nilai variabel global atau field static. Selain itu, bisa juga karena ada
perubahan pada main().
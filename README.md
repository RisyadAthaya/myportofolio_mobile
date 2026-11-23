<div align="center">
<h1 align="center">📱 My Portofolio Mobile</h1>
<p align="center">Portofolio Mobile App for PBP</p>

Nama: Risyad Athaya Muhammad

NPM: 2506595890

Kelas: PBP F
</div>

## ⚙️ How to Run
1. **Clone this repository** from terminal using the following command
   ```bash
   $ git clone https://github.com/RisyadAthaya/myportofolio_mobile.git
   ```
   then go to the project root directory
   ```bash
   $ cd myportofolio_mobile
   ```
2. **Install the dependencies** listed in pubspec.yaml using the following command (make sure the
   Flutter SDK is already installed)
   ```bash
   $ flutter pub get
   ```
3. **Prepare a device** by starting an Android emulator / iOS simulator, or by connecting a physical
   device with USB debugging enabled, then check that it is detected using the following command
   ```bash
   $ flutter devices
   ```
4. **Run the app** using the following command
   ```bash
   $ flutter run
   ```
   then wait until the build finishes and the app will open on the selected device.

## ❓ Reflective Questions

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

### Tugas 8
1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop().
   Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi
   Home di drawer membawa pengguna kembali ke halaman utama.

- Navigator.push() = Menaruh halaman baru di atas halaman yang sedang tampil. Halaman lama tetap
  ada, jadi pengguna bisa kembali.
- Navigator.pushReplacement() = Mengganti halaman yang sedang tampil dengan halaman baru. Halaman
  lama dibuang dari stack, jadi tidak bisa kembali ke halaman itu.
- Navigator.pop() = Membuang halaman paling atas dari stack sehingga pengguna kembali ke halaman
  sebelumnya.

Untuk membuka formulir dari kartu aksi, Navigator.push() dipakai di onTap, supaya pengguna bisa
kembali ke halaman utama setelah selesai atau membatalkan pengisian. Lalu, opsi Home di drawer
memakai Navigator.pushReplacement() ke MyHomePage. Halaman yang sedang dibuka diganti dengan
halaman utama, sehingga stack tidak menumpuk setiap kali pengguna memilih menu.

2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten?
   Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman.

Scaffold adalah kerangka halaman, AppBar adalah bar judul di atas, dan Drawer adalah menu samping
untuk berpindah halaman. Kalau semua halaman memakai susunan yang sama, pengguna selalu tahu letak
judul dan menu navigasi, sehingga aplikasi terasa satu kesatuan. Contoh warna tema: warna portofolio
diatur sekali di ThemeData pada MaterialApp, lalu dipakai lewat
Theme.of(context).colorScheme.primary. Di MyHomePage, AppBar memakainya sebagai backgroundColor.
Di FormPage, AppBar dan tombol Simpan memakai warna yang sama.

3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan
   widget penggulir ketika ruang layar terbatas.

Formulir disusun vertikal dengan Column di dalam Padding, sehingga urutan field mudah diikuti dari
atas ke bawah dan sesuai pola aplikasi mobile pada umumnya.

- Padding = Memberi jarak antara isi formulir dan tepi layar.
- SizedBox = Memberi jarak tetap antar-field supaya tidak berdempetan.
- SingleChildScrollView = Membuat isi formulir bisa digulir.

Saat ruang layar terbatas (HP kecil, mode landscape, atau papan ketik muncul), Column bisa
melebihi tinggi layar dan menyebabkan error overflow. Dengan SingleChildScrollView, pengguna tetap
bisa menggulir untuk menjangkau semua field dan tombol Simpan.

4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan
   satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan
   ketik saja belum cukup.

- GlobalKey<FormState> = Kunci pada widget Form agar state-nya bisa diakses dari luar, misalnya dari
tombol Simpan.
- validator = Fungsi pada TextFormField yang mengembalikan pesan error (String) kalau input tidak
valid, dan null kalau valid.
- validate() = Dipanggil lewat _formKey.currentState!.validate() untuk menjalankan semua validator
sekaligus. Hasilnya true kalau semua valid dan false kalau ada yang gagal.

Saat Simpan ditekan, kalau validate() bernilai false, pesan error muncul di bawah field dan data
tidak disimpan. Kalau true, data baru diproses. Contoh nilai yang ditolak: pada field deskripsi,
kalau pengguna tidak mengisinya, karena value dari string input tersebut tidak boleh empty.
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.

dari namanya sendiri kita ketahui bahwa widgter terr merupakah sebuah hierarki yang bentuknya seperti pohon, hal ini menggambarkan bagiamana widget-widget di Flutter nantinya saling berhubungan. setiap widget dapat memiliki widget lain di dalamnya, membentuk struktur (induk-anak).

Cara kerja hubungan parent-child:

- Parent widget adalah widget yang mengandung widget lain di dalamnya
- Child widget adalah widget yang berada di dalam parent widget
- Parent bertanggung jawab untuk mengatur layout dan menentukan constraints (batasan ukuran) untuk child-nya
- Child akan menerima constraints dari parent dan mengembalikan ukuran yang diinginkan
- Informasi mengalir dari atas ke bawah (parent ke child) melalui constructor parameters
- Events/actions mengalir dari bawah ke atas (child ke parent) melalui callbacks

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
    a. MaterialApp = Root widget aplikasi yang menyediakan konfigurasi material design
       Mengatur theme, title, dan home page aplikasi
    b. Scaffold = Menyediakan struktur dasar halaman dengan AppBar, Body, dan lainnya
       Framework untuk implementasi material design layout
    c. AppBar = Menampilkan bar di bagian atas aplikasi
       Berisi judul "Football Shop"
    d. Padding = Memberikan jarak/ruang di sekitar widget child-nya
       Digunakan untuk memberi spacing pada body
    e. Column = Menyusun children widget secara vertikal (atas ke bawah)
       Digunakan untuk menyusun InfoCard dan GridView
    f. Row = Menyusun children widget secara horizontal (kiri ke kanan)
       Digunakan untuk menampilkan 3 InfoCard secara berdampingan
    g. Card = Menampilkan panel dengan sudut membulat dan elevation (bayangan)
       Digunakan untuk InfoCard (NPM, Name, Class)
    h. Container = Widget serbaguna untuk styling dan positioning
       Digunakan untuk membungkus konten dengan padding dan ukuran tertentu
    i. GridView.count = Menampilkan children dalam bentuk grid dengan jumlah kolom tetap
       Digunakan untuk menampilkan 3 tombol dalam grid 3 kolom
    j. Material = Memberikan visual material design pada widget
       Digunakan sebagai background ItemCard dengan warna dan border radius
    k. InkWell = Memberikan efek ripple ketika widget di-tap
       Menangani gesture tap pada ItemCard
    l. Icon = Menampilkan icon dari material icons
       Digunakan untuk ikon pada setiap tombol
    m. Text = Menampilkan teks
       Digunakan untuk label, judul, dan konten teks
    n. SizedBox = Memberikan jarak/spacing dengan ukuran tetap
       Digunakan untuk memberi jarak antar widget
    o. SnackBar = Menampilkan pesan sementara di bagian bawah layar
       Muncul ketika tombol ditekan
    p. ScaffoldMessenger = Mengelola dan menampilkan SnackBar
       Digunakan untuk show/hide SnackBar

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
MaterialApp = Root widget aplikasi yang menyediakan konfigurasi material design
Mengatur theme, title, dan home page aplikasi

karena dia menyediakan semua koonfigurasi apilkasi di satu tempat, kkemudian material designnya terintegrasi, menyediakan buildcontext yang diperlukan juga untuk navigasi dan theme, serta simple

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Stateless widget = tidak memiliki state yang dapat berubah, immutable, hanya di build sekali, lebih ringan dan efisien dalam performa

statefull widget = punya state yang dapat berubah, mutable, dapat di rebuild berkali kali ketika state berubah, punya method seState() untuk update UI

Kita menggunakan statelesswidget ketika UI yang mau di implement itu statis/tidak berubah, kalo menampilkan data yang juga tidak berubah, komponennya itu presentational (jadi cuman untuk tampilan gitu)
kita menggubnakan Statefull widget ketika UI kita perlu yang interaktif dan bisab erubah berubah terus, ada form dengan input user, animasi, data yang di fetch dari API, ada counter/timer/state yang berubah ubah

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?

BuildContext -> object yang merepresentasikan loasi widget dalam widget tree. setiap widget punya BuildContextnya sendiri. ia penting karena akasesnya ke widget tree bisa memberikan referensi ke posisi widget dalam tree, kemudian dia juga memungkinkan widget berkomunikasi dengan parent. tak hanya itu ia juga bisa akses theme, bisa nge navigasi, bisa akses InheritedWidget, dan bisa nampilin Snackbar

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Hot reload -> fitur yang memungkinkan developer melihat perubahan kode secara instant tanpa kehilangan state aplikasi
Hot restart -> fitur yang restart aplikasi dari awal namun lebih cepat dari build ulang penuh

perbedaan antara hot reload dan restart berada pada karakteristiknya dimana hot restart itu lebih lambat dari hot reload, kemudian ia juga menghapus semua state karena applikasi kembali ke state awal, kalo ho reload dia cepet banget dan bisa mempertahankan statenya jadi data dan posisi UI nggak hilang cuman update kodenya sehingga tidak restart aplikasi.

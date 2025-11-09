 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada         aplikasi Football Shop kamu?

    Navigator push = baut nambah halaman baru di atas halaman saat ini
    Navigator pushReplacement = ngeganti halaman saat ini dengan halaman baru

    kalo dalam implementasi di football shop itu buat misal mau create product itu better pake push aja karena buat ngebikin page baru yang dimana nanti kalo mau back bakal bisa ke homenya lagi

    kalo push replacement di set buat ke halaman utama karena itu kan akar dari semua kita mau kemana jadi gapapa push replacement aja

 2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?

    pertama pake scaffold dulu yang dimana dia itu kan kerangka daasarnya di setiap halaman karena dia nyediain appbar, body, sama drawer
    barulah habis scaffold kita pake app bar buat nampilin judul, ikon navigasinya, terus baru pake drawer buat nge navigisiin benerannya

 3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan   elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.

 padding = buat ngasih jarak antar elemen biar looksnya nanti lebih rapoi sama enak dibacanya
    contoh: di tempat bagian infocard buat ngenampilin nama, npm, sama kelas

 singlechildscrollview = buat bikin biar bisa di scroll tampilannya 
    contoh: di form buat nambahin produk

 listview = buat nampilin daftar elemen yang sifatnya dinamis
    conbtoh: di bagian drawer

 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
    untuk ini karena saya nggak menggunakan brand manapun sehingga saya menggantinya untuk mengikuti football shop yang sudah saya bikin pada django
    kita disini bermain di main.dart dmana kita ganti coloschemenya yang awalnya dari primary swatch jadi fromSeed, hal ini dilakukan karena kalo fromseed itu dia juga otomatis nge generate primary, secondary, tertiary, background, surface, etc juga buat warnanya jadi nanti M3 tonenya bakal lebih harmoni atau sesuai satu sama lain
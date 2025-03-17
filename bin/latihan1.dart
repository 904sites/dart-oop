// Tugas Latihan 2

// Nomor 1
class Mobil {
  String merk;
  String model;
  int tahun;

  Mobil(this.merk, this.model, this.tahun);

  void tampilkanInfo() {
    print('Mobil: $merk, $model, Tahun: $tahun');
  }
}

// Nomor 2
class Mahasiswa {
  String nama;
  String nim;

  Mahasiswa({this.nama = "Ahdina Sabilal Muna", this.nim = "221240001329"});

  void tampilkanInfo() {
    print('Mahasiswa: $nama, NIM: $nim');
  }
}

// Nomor 3
class Buku {
  String judul;
  String pengarang;

  Buku(this.judul, this.pengarang);

  void tampilkanInfo() {
    print('Buku: "$judul" oleh $pengarang');
  }
}

// Nomor 4
class Segitiga {
  double alas;
  double tinggi;
  String jenis;

  Segitiga(this.alas, this.tinggi, this.jenis);

  Segitiga.sikuSiku(double alas, double tinggi)
      : this.alas = alas,
        this.tinggi = tinggi,
        this.jenis = "Siku-siku";

  void tampilkanInfo() {
    print('Segitiga $jenis dengan alas $alas dan tinggi $tinggi');
  }
}

// Nomor 5
class Warna {
  final int red;
  final int green;
  final int blue;

  const Warna(this.red, this.green, this.blue);

  void tampilkanInfo() {
    print('Warna: RGB($red, $green, $blue)');
  }
}

void main() {
  var mobil = Mobil("Toyota", "Avanza", 2022);
  mobil.tampilkanInfo();

  var mahasiswa = Mahasiswa();
  mahasiswa.tampilkanInfo();

  var buku = Buku("Heaven", "Mieko Kawakami");
  buku.tampilkanInfo();

  var segitiga = Segitiga.sikuSiku(3, 4);
  segitiga.tampilkanInfo();

  var warna1 = const Warna(255, 0, 0);
  var warna2 = const Warna(0, 255, 0);
  var warna3 = const Warna(0, 0, 255);

  warna1.tampilkanInfo();
  warna2.tampilkanInfo();
  warna3.tampilkanInfo();
}

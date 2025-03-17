// Tugas Latihan 2

// Nomor 1: Class Hewan (induk) dan class Kucing (anak)
class Hewan {
  String nama;

  // Constructor
  Hewan(this.nama);

  void suara() {
    print("$nama mengeluarkan suara");
  }
}

// Class anak dari Hewan
class Kucing extends Hewan {
  String jenisBulu;

  // Constructor dengan super untuk memanggil constructor parent
  Kucing(String nama, this.jenisBulu) : super(nama);

  // Override method suara dari parent class
  @override
  void suara() {
    print("$nama mengeluarkan suara: Meow! Myo! Meow!");
  }

  void tampilkanInfo() {
    print("Kucing bernama $nama dengan jenis bulu $jenisBulu");
  }
}

// Nomor 2: Class RekeningBank dengan encapsulation
class RekeningBank {
  // Private property dengan underscore
  double _saldo = 0;
  String pemilik;
  String nomorRekening;

  // Constructor
  RekeningBank(this.pemilik, this.nomorRekening, [double setoranAwal = 0]) {
    if (setoranAwal > 0) {
      this._saldo = setoranAwal;
    }
  }

  // Getter untuk saldo
  double get saldo => _saldo;

  // Method untuk setoran
  void setor(double jumlah) {
    if (jumlah <= 0) {
      print("Jumlah setoran harus lebih dari 0");
      return;
    }
    _saldo += jumlah;
    print("Setoran berhasil. Saldo saat ini: $_saldo");
  }

  // Method untuk penarikan
  bool tarik(double jumlah) {
    if (jumlah <= 0) {
      print("Jumlah penarikan harus lebih dari 0");
      return false;
    }

    if (jumlah > _saldo) {
      print("Saldo tidak mencukupi untuk penarikan sebesar $jumlah");
      return false;
    }

    _saldo -= jumlah;
    print("Penarikan berhasil. Saldo saat ini: $_saldo");
    return true;
  }

  void tampilkanInfo() {
    print("Informasi Rekening Bank:");
    print("Pemilik: $pemilik");
    print("Nomor Rekening: $nomorRekening");
    print("Saldo: $_saldo");
  }
}

// Nomor 3: Class BangunDatar dan turunannya (polymorphism)
class BangunDatar {
  String nama;

  BangunDatar(this.nama);

  double hitungLuas() {
    print("Menghitung luas $nama");
    return 0; // Default implementation
  }
}

class Persegi extends BangunDatar {
  double sisi;

  Persegi(this.sisi) : super("Persegi");

  @override
  double hitungLuas() {
    double luas = sisi * sisi;
    print("Luas $nama dengan sisi $sisi adalah $luas");
    return luas;
  }
}

class SegitigaBD extends BangunDatar {
  double alas;
  double tinggi;

  SegitigaBD(this.alas, this.tinggi) : super("Segitiga");

  @override
  double hitungLuas() {
    double luas = 0.5 * alas * tinggi;
    print("Luas $nama dengan alas $alas dan tinggi $tinggi adalah $luas");
    return luas;
  }
}

// Nomor 4: Abstract class Bentuk dan implementasi Lingkaran
abstract class Bentuk {
  // Abstract method (tidak memiliki implementasi)
  double hitungLuas();

  // Method biasa (memiliki implementasi)
  void deskripsi() {
    print("Ini adalah sebuah bentuk geometri.");
  }
}

class Lingkaran extends Bentuk {
  double jariJari;

  Lingkaran(this.jariJari);

  @override
  double hitungLuas() {
    double luas = 3.14 * jariJari * jariJari;
    print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");
    return luas;
  }

  @override
  void deskripsi() {
    print("Ini adalah bentuk lingkaran dengan jari-jari $jariJari.");
  }
}

void main() {
  print("===== Nomor 1: Inheritance =====");
  Kucing kucing = Kucing("Marbelle", "Calico");
  kucing.tampilkanInfo();
  kucing.suara();

  print("\n===== Nomor 2: Encapsulation =====");
  RekeningBank rekening = RekeningBank("Ahdina", "0123456789", 5000000);
  rekening.tampilkanInfo();

  // Test transaksi
  rekening.setor(2000000);
  rekening.tarik(1500000);
  rekening.tarik(7000000); // Akan gagal karena saldo tidak cukup

  // Tidak bisa mengakses saldo secara langsung untuk mengubahnya
  // rekening._saldo = 5000000; // Ini akan error bila di library terpisah

  // Tapi bisa mengakses saldo lewat getter
  print("Saldo saat ini: ${rekening.saldo}");

  print("\n===== Nomor 3: Polymorphism =====");
  BangunDatar bangunDatar = BangunDatar("BangunDatar");
  bangunDatar.hitungLuas();

  Persegi persegi = Persegi(5);
  persegi.hitungLuas();

  SegitigaBD segitiga = SegitigaBD(6, 8);
  segitiga.hitungLuas();

  // Polymorphism dengan referensi parent class
  BangunDatar bentuk1 = Persegi(4);
  BangunDatar bentuk2 = SegitigaBD(3, 6);

  bentuk1.hitungLuas(); // Memanggil method override di class Persegi
  bentuk2.hitungLuas(); // Memanggil method override di class Segitiga

  print("\n===== Nomor 4: Abstraction =====");
  // Bentuk bentuk = Bentuk(); // Error karena tidak bisa instantiate abstract class

  Lingkaran lingkaran = Lingkaran(7);
  lingkaran.deskripsi();
  lingkaran.hitungLuas();
}

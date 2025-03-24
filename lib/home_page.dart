import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final Color mainBlue = Color(0xFF0A237E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Koperasi Undiksha',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: mainBlue,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Konfirmasi', style: TextStyle(color: Colors.black)),
                  content: Text('Apakah Anda yakin ingin keluar?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('Batal'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
                      child: Text('Keluar'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              //  PROFIL NASABAH
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  children: [
                    // Foto Profil
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: mainBlue, width: 3),
                        boxShadow: [
                          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4)),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/tora.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Kartu Informasi Nasabah & Saldo
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Color(0xFFE8F0FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          _infoRow('Nasabah', 'Tora Anggito'),
                          Divider(thickness: 1, color: Colors.blueGrey[200]),
                          _infoRow('Total Saldo Anda', 'Rp. 1.500.000', isBold: true),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //  GRID MENU UTAMA
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
                  ],
                ),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.1,
                  children: [
                    _menuCard(Icons.account_balance_wallet, 'Cek Saldo'),
                    _menuCard(Icons.send, 'Transfer'),
                    _menuCard(Icons.savings, 'Deposito'),
                    _menuCard(Icons.payment, 'Pembayaran'),
                    _menuCard(Icons.money, 'Pinjaman'),
                    _menuCard(Icons.receipt, 'Mutasi'),
                  ],
                ),
              ),
              SizedBox(height: 20),

              //  BANTUAN KONTAK
             Container(
                padding: EdgeInsets.all(16), // Memberikan jarak ke dalam
                decoration: BoxDecoration(
                  color: Colors.grey[200], // Warna background
                  borderRadius: BorderRadius.circular(10), // Sudut melengkung
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12, blurRadius: 5, offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text('Butuh Bantuan?', 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '0812-3456-7891',
                          style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.phone, color: Colors.blue, size: 30),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),


              //  BOTTOM MENU (NAVIGASI)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomMenu(Icons.settings, 'Setting', false),
                  _bottomMenu(Icons.qr_code, 'QR Code', true),
                  _bottomMenu(Icons.person, 'Profile', false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  //  BARIS INFORMASI NASABAH
  Widget _infoRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
              color: isBold ? Colors.black : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  //  MENU UTAMA (Cek Saldo, Transfer, dsb)
  Widget _menuCard(IconData icon, String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: mainBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  //  MENU NAVIGASI BAWAH (Setting, QR, Profile)
  Widget _bottomMenu(IconData icon, String title, bool isMain) {
    final double size = isMain ? 70 : 50;

    return Column(
      children: [
        Container(
          width: size,
          height: size,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isMain ? mainBlue : Colors.white,
            borderRadius: BorderRadius.circular(isMain ? 35 : 10),
            boxShadow: [
              BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
            ],
            border: isMain ? null : Border.all(color: mainBlue, width: 2),
          ),
          child: Icon(icon, size: isMain ? 40 : 25, color: isMain ? Colors.white : mainBlue),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

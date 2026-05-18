//naik github ah
import 'package:flutter/material.dart';

void main() {
  runApp(const MironScentApp());
}

class MironScentApp extends StatelessWidget {
  const MironScentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Miron Scent',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0), // Background utama hitam pekat
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. CUSTOM APP BAR (MENU ICON) ---
              const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 16.0, bottom: 8.0),
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
              ),

              // --- 2. TOP HERO BANNER ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AspectRatio(
                  aspectRatio: 1.9, 
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff3a1f14),
                      borderRadius: BorderRadius.circular(30),
                      image: const DecorationImage(
                        image: AssetImage('lib/assets/images/baner.png'), // Banner Utama
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // --- TAMBAHAN KODE GAMBAR DENGAN PADDING ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding kiri-kanan biar sejajar sama banner atas
                child: Container(
                  width: double.infinity, // Memenuhi lebar layar iPhone 16
                  height: 180, // Kamu bisa atur tinggi gambar di sini sesuai selera
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), // Sudut membulat halus sesuai desain kamu
                    image: const DecorationImage(
                      image: AssetImage('lib/assets/images/baner2.png'), // Ganti dengan nama file gambar yang mau kamu tampilin (misal: 12.png atau baner2.png)
                      fit: BoxFit.cover, // Biar gambarnya rapi memenuhi container tanpa gepeng
                    ),
                  ),
                ),
              ),

              // Beri jarak lagi di bawahnya sebelum masuk ke list produk
              const SizedBox(height: 24),

              // --- 3. MID BANNER SECTION (TEKS & RECAPT) ---
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff1a0a05),
                      Colors.black,
                    ],
                  ),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60.0),
                      child: Text(
                        'Karena first impression matters, mulai dari scent yang tepat. Miron Parfume, bikin lo lebih stand out setiap hari',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.9),
                          height: 1.6,
                          letterSpacing: 0.2,
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: Text(
                        'Recapt',
                        style: TextStyle(
                          fontFamily: 'Cursive',
                          fontSize: 0,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // --- 4. PRODUCT CATALOG HORIZONTAL LIST ---
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 3,
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final products = [
                      _ProductItem('lib/assets/images/13.png', 'Vanila Rose', 'IDR. 40.000'),
                      _ProductItem('lib/assets/images/12.png', 'Pinerush', 'IDR. 43.000'),
                      _ProductItem('lib/assets/images/15.png', 'Velina', 'IDR. 43.000'),
                    ];
                    return _buildProductCard(products[index]);
                  },
                ),
              ),

              const SizedBox(height: 30),

              // --- 5. FOOTER STORYTELLING SECTION ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Center(
                  child: Text(
                    'Miron Parfume adalah parfum lokal berkualitas yang difokuskan terhadap karakter dan experience, dengan itu miron menghadirkan pengalaman emosional melalui storytelling di setiap varian, sehingga konsumen merasa parfum tersebut adalah bagian dari dirinya.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.white.withOpacity(0.7),
                      height: 1.7,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // --- 6. CLEAN BOTTOM NAVIGATION BAR ---
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xffeeeeee), width: 1)),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.black,
          unselectedItemColor: const Color(0xff757575),
          selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 0.5),
          unselectedLabelStyle: const TextStyle(fontSize: 11, letterSpacing: 0.5),
          items: const [
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.home_outlined)),
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.home)),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.shopping_cart_outlined)),
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.shopping_cart)),
              label: 'Catalog',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.favorite_border)),
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.favorite)),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.person_outline)),
              activeIcon: Padding(padding: EdgeInsets.only(bottom: 4), child: Icon(Icons.person)),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(_ProductItem product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
              image: AssetImage(product.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          product.price,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xff9e9e9e),
          ),
        ),
      ],
    );
  }
}

class _ProductItem {
  final String imagePath;
  final String name;
  final String price;

  _ProductItem(this.imagePath, this.name, this.price);
}
import 'package:flutter/material.dart';

// Home Page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final String _searchQuery = ''; // Search query variable

  final List<Widget> _pages = <Widget>[
    BerandaPage(),
    const ProdukPage(),
    const Center(
        child: Text('Chat',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    const Center(
        child: Text('Profil',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flowers Shop'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromARGB(255, 250, 56, 137),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Cart clicked!')));
            },
          ),
          // Search Icon Button
          //   
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'Produk'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 250, 56, 137),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
//produk
class ProdukPage extends StatefulWidget {
  const ProdukPage({super.key});

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  TextEditingController controller = TextEditingController();

  // Contoh data produk
  final List<Map<String, dynamic>> produkList = [
    {
      "nama": "Rose",
      "harga": 50000,
      "gambar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzWd7h-j37sx-XfozN_W_Sin8BVPluFun7oQ&s",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Lily",
      "harga": 60000,
      "gambar":
          "https://images.tokopedia.net/img/cache/700/VqbcmM/2021/3/5/26c0647a-04cb-4053-854a-c8a198feb069.jpg",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Tulip",
      "harga": 121000,
      "gambar":
          "https://media.istockphoto.com/id/147087181/photo/purple-tulips-in-bucket.jpg?s=612x612&w=0&k=20&c=21_Sg7OyNNBCPLPtIHLHG2GamYHNFThJl54iiEibg10=",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Sun Flower",
      "harga": 250000,
      "gambar":
          "https://st4.depositphotos.com/17566348/39101/i/450/depositphotos_391014164-stock-photo-artificial-sunflower-bucket-real-modern.jpg",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
    {
      "nama": "Daisy",
      "harga": 150000,
      "gambar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSsRXAuq9Y1voUwv3lV-twjkOSFn1w4Kz8XQ&s",
      "bintang": 4.5,
      "terjual": 20,
      "kategori": "terbaru"
    },
       {
      "nama": "Peony",
      "harga": 180000,
      "gambar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ_qpBlUoWgXIU-cdpLkA_CWiyOry0bCMRSg&s",
      "bintang": 4.0,
      "terjual": 80,
      "kategori": "terbaru"
    },
    {
      "nama": "Love",
      "harga": 340000,
      "gambar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHwM-caLy1K2_n_5g3OStKtUgyUsSht7m4TQ&s",
      "bintang": 4.0,
      "terjual": 80,
      "kategori": "terlaris"
    },
    {
      "nama": "Love 2 ",
      "harga": 2090000,
      "gambar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQheizut3PkbGVOvya7jVL46cpKcreJKRDy5w&s",
      "bintang": 4.8,
      "terjual": 50,
      "kategori": "terkait"
    },
  ];

  // Kategori aktif yang dipilih
  String selectedCategory = 'terbaru';

  // Fungsi untuk memfilter produk sesuai kategori
  List<Map<String, dynamic>> get filteredProducts {
    return produkList
        .where((produk) => produk['kategori'] == selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // TextField Pencarian
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Expanded(
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Cari produk...',
          contentPadding: EdgeInsets.only(left: 10), // Menambahkan padding kiri
        ),
      ),
    ),
    const Padding(
      padding: EdgeInsets.only(right: 10),
      child: Icon(Icons.search),
    ),
  ],
),),

          const SizedBox(height: 20),
          // Banner
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 250, 56, 137),
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5FhxpQNwV2bqErPBjHZVd3utC2x7ZlHgpaA&s'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Baris Kategori dengan Garis Vertikal
          Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    Expanded(
      child: Center(
        child: _buildCategoryButton('Terbaru', 'terbaru'),
      ),
    ),
    const SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.black,
        thickness: 2,
        width: 10,
      ),
    ),
    Expanded(
      child: Center(
        child: _buildCategoryButton('Terlaris', 'terlaris'),
      ),
    ),
    const SizedBox(
      height: 20,
      child: VerticalDivider(
        color: Colors.black,
        thickness: 2,
        width: 10,
      ),
    ),
    Expanded(
      child: Center(
        child: _buildCategoryButton('Terkait', 'terkait'),
      ),
    ),
  ],
),

          const SizedBox(height: 20),
          // Grid Produk
          Expanded(
  child: GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 0.6,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    ),
    itemCount: filteredProducts.length,
    itemBuilder: (context, index) {
      final produk = filteredProducts[index];
      var boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      );
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: boxDecoration,
        child: Column(
          children: [
            Image.network(
              produk['gambar'],
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              produk['nama'],
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              "Rp. ${produk['harga']}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 255, 7, 181),
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 255, 7, 181),
                      size: 16,
                    ),
                    Text(
                      produk['bintang'].toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(), // Untuk memberikan jarak antara bintang dan terjual
                Text(
                  "${produk['terjual']} Terjual",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  ),
),
        ],
      ),
    );
  }

  // Widget untuk tombol kategori
  Widget _buildCategoryButton(String label, String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selectedCategory == category ? const Color.fromARGB(255, 250, 56, 137): Colors.black,
        ),
      ),
    );
  }
}




// Product Search Delegate
class ProductSearch extends SearchDelegate<String> {
  final List<Product> products = [
    Product(name: 'Rose', price: 50000),
    Product(name: 'Lily', price: 60000),
    
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: results.map<Widget>((product) {
        return ListTile(
          title: Text(product.name),
          subtitle: Text('Harga: Rp ${product.price}'),
          onTap: () {
            Navigator.pushNamed(context, '/produk', arguments: product.name);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView(
      children: suggestions.map<Widget>((product) {
        return ListTile(
          title: Text(product.name),
          subtitle: Text('Harga: Rp ${product.price}'),
          onTap: () {
            Navigator.pushNamed(context, '/produk', arguments: product.name);
          },
        );
      }).toList(),
    );
  }
}

// BerandaPage, Product, LoginPag
class BerandaPage extends StatelessWidget {
  final List<Product> products = [
    Product(name: 'Rose', price: 50000),
    Product(name: 'Lily', price: 60000),
    Product(name: 'Orchid', price: 50000),
    Product(name: 'Sun Flower', price: 60000),
  ];

  final TextEditingController controller = TextEditingController();

  BerandaPage({super.key}); // Controller for search field

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Greeting Text
          const Text(
            'Yuk pilih bunga di toko kami',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Dropdown Menu for Chocolate Types
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide.none,
              ),
            ),
            items: <String>[
              'Semua Jenis',
              'Rose',
              'Orchid',
              'Sun Flower'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              // Handle the change
            },
            hint: const Text('Pilih Bunga'),
          ),
          const SizedBox(height: 16),

          // Search Field
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Cari produk...',
              contentPadding: const EdgeInsets.only(left: 10),
              filled: true,
              fillColor: Colors.grey[200],
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 232, 61, 143),
                  width: 2,
                ),
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Banner Promosi with Different Images in Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
            ),
            itemCount: 2,
            itemBuilder: (context, index) {
              final List<String> bannerImages = [
                'https://img.pikbest.com/wp/202413/spring-festival-gift-box-flower-love-promotion-web-banner_8987983.jpg!w700wp',
                'https://img.pikbest.com/wp/202413/floral-promotion-three-dimensional-women-s-day-festival-web-banner_8989427.jpg!w700wp',
              ];

              return Container(
                height: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 221, 82, 154),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(bannerImages[index]),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 16),

          // Product Recommendations in Grid
          const Text(
            'Rekomendasi Bunga',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: products.length < 4 ? products.length : 4, // Limit to 4 items for a 2x2 grid
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // 2 columns
    crossAxisSpacing: 5, // Decreased spacing between columns
    mainAxisSpacing: 5, // Decreased spacing between rows
    childAspectRatio: 1, // Aspect ratio can be less than 1 for taller boxes
  ),
  itemBuilder: (context, index) {
    final product = products[index];
    return Container(
      padding: const EdgeInsets.all(4),
      child: ProductBox(product: product),
    );
  },
),
        ],
      ),
    );
  }
}

// Widget Kotak Produk
class ProductBox extends StatelessWidget {
  final Product product;

  const ProductBox({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/produk', arguments: product.name);
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 222, 66, 152), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
                
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQheizut3PkbGVOvya7jVL46cpKcreJKRDy5w&s',
                height: 100),
                
            const SizedBox(height: 8),
            Text(product.name,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Rp ${product.price}',
                style:
                    const TextStyle(color: Color.fromARGB(255, 133, 103, 38))),
          ],
        ),
      ),
    );
  }
}

// Model Produk
class Product {
  final String name;
  final int price;

  Product({required this.name, required this.price});
}

// Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var children = [
                  // Welcome text
                  const Text(
                    'Warnai harimu, yuk pilih bunga favoritmu',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color:  const Color.fromARGB(255, 250, 56, 137),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Central image with a fallback URL
                  Image.network(
                    'https://pluspng.com/img-png/flower-png-flower-png-transparent-image-1000.png', // Fallback example
                    height: 150,
                  ),
                  const SizedBox(height: 30),

                  // Login Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 222, 66, 152),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Sign Up Button as an Outlined Button
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: const BorderSide(
                        color: const Color.fromARGB(255, 222, 66, 152),
                        width: 2,
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 222, 66, 152),
                      ),
                    ),
                  ),
                ];
    var children2 = [
          // Logo at the top-left corner
          Positioned(
            top: 40,
            left: 16,
            child: Image.network(
              'https://pluspng.com/img-png/flower-png-flower-png-transparent-image-1000.png',
              height: 50,
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              ),
            ),
          ),
          // Copyright text at the bottom
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                '© 2024 Yunita Flower Shop. All Rights Reserved.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
        ];
    return Scaffold(
      body: Stack(
        children: children2,
      ),
    );
  }
}

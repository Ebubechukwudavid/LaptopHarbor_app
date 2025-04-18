import 'dart:async';
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'category.dart';
import 'all_category.dart';
import 'product_detail.dart';
import 'account_page.dart';
import 'customer_care_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  // List of image asset paths for the slider.
  final List<String> imageList = [
    'assets/macbook_ad.jpg',
    'assets/asus_gaming.jpg',
    'assets/dell_ad.jpg',
    'assets/lenovo_ad.jpg',
    'assets/gaming_ad.jpg',
    'assets/redimi_ad.jpg',
  ];

  // List of laptop models/brands available for search and categories.
  final List<String> laptopModels = [
    "Apple Laptops",
    "Dell Laptops",
    "Gaming Laptops",
    "Asus Laptops",
  ];

  // List of products to showcase (sample data for 6 products).
  final List<Map<String, dynamic>> products = [
    {
      'name': 'Victus Gaming Laptop 15',
      'image': 'assets/gaming_1.png',
      'Brand': 'Brand: Hp | Similar products from Hp',
      'desc': 'Product detail'
      '\n'
      'Victus Gaming Laptop 15\n'
      '\nSuperior processing components\n'
      '\nPlay at your best with a 12th Gen Intel® Core™ processor 4, a modern graphics card, and plenty of memory\n'
      '\nSophisticated and refined design\n'
      '\nWith a smaller footprint and up to three colors options 5, this spritely device looks good anywhere.\n'
      '\nEvery feature you could need\n'
      '\nFrom the updated thermal design to the HD camera, this laptop has everything.\n'
      '\nExtend beyond performance to let your PC do even more at once Offering more than just a performance score. 12th Gen Intel® Core™ Processors advance real-world computing and deliver more ultra-efficient multi-tasking.\n'
      ,
      'specifications':
      '\n'
      'PROCESSOR: 12TH Gen, Intel® Core™ i5-12450H (up to 4.6 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 8 cores, 12 threads) \n'
      '\nMEMORY: 16 GB DDR4-3200 MHz RAM (2 x 8 GB)\n '
      '\nSTORAGE: 512 GB PCIe® Gen4 NVMe™ TLC M.2 SSD \n'
      '\nDISPLAY: 39.6 cm (15.6") diagonal, FHD (1920 x 1080), 144 Hz, 9 ms response time, IPS, micro-edge, anti-glare, 250 nits, 45% NTS \n'
      '\nKEYBOARD: Full-size, backlit, mica silver keyboard with numeric keypad\n '
      '\nOPERATING SYSTEM: Windows 11\n',
      'rating': 4.8,
      'reviewCount': 120,
      'price': '\$2600.00',
      'stock': 'In stock',
      'additionalImages': [
        'assets/gaming_1.png',
        'assets/gaming_2.jpg',
        'assets/gaming_3.png',
        'assets/gaming_4.png',
      ],
    },
    {
      'name': 'ELITEBOOK 840 G6',
      'image': 'assets/elite_1.png',
      'Brand': 'Brand: Hp | Similar products from Hp',
      'desc': 'Product detail'
      '\n'
      '\n ELITEBOOK 840 G6 - INTEL CORE I5 - FINGERPRINT READER- BACKLIT KEYBOARD- FULL HD DISPLA\n'
      '\nProduct Type: ELITEBOOK 840 G6\n'
      '\n\nMax RAM Supported: 64 GB\n'
      '\nRAM: 12GB\n'
      '\nV-Sync Rate at Max Res.:	 60 Hz\n'
      '\nImage Brightness: 	250 cd/m²\n'
      '\nAudio Features: 	Bang & Olufsen Audio\n',
      'specifications':
       '\n'
      'Key Features\n'
      '\nOperating system:  WINDOWS 11 PRO - FINGERPRINT- KEYBOARD LIGHT \n'
      '\nINTEL CORE I5 FAST PROCESSOR (Processor Up to 4.5 GHz max boost clock with Intel Turbo boost system, 12 MB L3 cache, 8 threads) \n'
      '\nMemory: 12GB DDRA RAM\n'
      '\nInternal drive: 512GB SSD\n'
      '\nCamera: True Vision 720p HD camera with integrated dual array digital microphonesAudio features: Dual speakersKeyboard: Full-size, jet black keyboard with numeric keypadWireless: Realtek RTL8821CE 802.11a/b/g/n/ac (1x1) Wi-Fi® and Bluetooth® 4.2 comboPower supply type: XMR x D x H): 35.85 x 24.2 x 1.79 cmWeight 1.69 kg \n'
      '\nGraphics: Integrated: INTEL FHD Crystal Clear Graphics \n'
      '\nWeight (kg): 1.77 \n'
      '\nColor: SILVER\n'
      '\nSize (L x W x H cm): 37.6 x 24.6 x 2.25\n',
      'rating': 4.5,
      'reviewCount': 95,
      'price': '\$2500.00',
      'stock': 'In stock',
      'additionalImages': [
        'assets/elite_1.png',
        'assets/elite_2.png',
        'assets/elite_3.png',
        'assets/elite_4.png',
      ],
    },
    {
      'name': 'Hp Stream 11 64GB 4GB',
      'image': 'assets/HpStream_2.png',
      'Brand': 'Brand: Hp | Similar products from Hp',
      'desc': 'Product details'
          '\n'
          '\nWeight: 2.00 kg\n'
          '\nActivity: Personal\n'
          '\n\nGraphics:	VGA\n'
          '\nRAM: 4GB\n'
          '\nWireless:	Yes, Bluetooth,\n'
          '\nImage Brightness: 	250 cd/m²\n'
          '\nAudio Features: 	Bang & Olufsen Audio\n',
      'specifications':
      '\n'
          'Key Features\n'
          '\nOperating system:  WINDOWS 11 PRO - FINGERPRINT- KEYBOARD LIGHT \n'
          '\nMemory: 12GB DDRA RAM\n'
          '\nInternal drive: 512GB SSD\n'
          '\nMicroprocessor Intel® Celeron(up to 2.5 GHz with Intel® Turbo Boost Technology, 6 MB L3 cache, )\n'
          '\nGraphics: Integrated: INTEL FHD Crystal Clear Graphics \n'
          '\nWeight (kg): 1.77 \n'
          '\nHard drive 64GB SSD\n',
      'rating': 5.6,
      'reviewCount': 70,
      'price': '\$2000.00',
      'stock': 'In stock',
      'additionalImages': [
        'assets/HpStream_1.png',
        'assets/HpStream_2.png',
    ],
    },
    {
      'name': 'DELL LATITUDE 3190',
      'image': 'assets/Dell_3.png',
    'Brand': 'Brand: Hp | Similar products from Hp',
    'desc': 'Product details'
      '\n'
          '\nDELL LATITUDE 3190\n'
          '\nSuperior processing components\n'
          '\nPlay at your best with a 12th Gen Intel® Core™ processor 4, a modern graphics card, and plenty of memory\n'
          '\nSophisticated and refined design\n'
          '\nWith a smaller footprint and up to three colors options 5, this spritely device looks good anywhere.\n'
          '\nEvery feature you could need\n'
          '\nFrom the updated thermal design to the HD camera, this laptop has everything.\n'
          '\nExtend beyond performance to let your PC do even more at once Offering more than just a performance score. 12th Gen Intel® Core™ Processors advance real-world computing and deliver more ultra-efficient multi-tasking.\n',

      'specifications':
      '\n'
          '\nPROCESSOR: 12TH Gen, Intel® Core™ i5-12450H (up to 4.6 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 8 cores, 12 threads) \n'
          '\nMEMORY: 16 GB DDR4-3200 MHz RAM (2 x 8 GB)\n '
          '\nSTORAGE: 512 GB PCIe® Gen4 NVMe™ TLC M.2 SSD \n'
          '\nDISPLAY: 39.6 cm (15.6") diagonal, FHD (1920 x 1080), 144 Hz, 9 ms response time, IPS, micro-edge, anti-glare, 250 nits, 45% NTS \n'
          '\nKEYBOARD: Full-size, backlit, mica silver keyboard with numeric keypad\n '
          '\nOPERATING SYSTEM: Windows 11\n',
      'rating': 3.7,
      'reviewCount': 60,
      'price': '\$2400.00',
      'stock': 'In stock',
      'additionalImages': [
        'assets/Dell_1.png',
        'assets/Dell_2.png',
        'assets/Dell_3.png',
      ],
    },
    {
      'name': 'Apple MacBook Air 13" M1 Chip 8GB 256GB 2020 Model - Gold',
      'image': 'assets/Apple_2.png',
      'Brand': 'Brand: Hp | Similar products from Hp',
      'descr': 'Product details'
      '\n'
      '\n Apple’s thinnest and lightest notebook gets supercharged with the Apple M1 chip. Tackle your projects with the blazing-fast 8-core CPU. Take graphics-intensive apps and games to the next level with the 7-core GPU. And accelerate machine learning tasks with the 16-core Neural Engine. All with a silent, fanless design and the longest battery life ever — up to 18 hours.¹ MacBook Air. Still perfectly portable. Just a lot more powerful.\n'
      '\n Apple-designed M1 chip for a giant leap in CPU, GPU, and machine learning performance, Go longer than ever with up to 18 hours of battery life¹\n'
      '\n8-core CPU delivers up to 3.5x faster performance to tackle projects faster than ever²\n'
      '\nSeven GPU cores with up to 5x faster graphics for graphics-intensive apps and games²\n'
      '\n 16-core Neural Engine for advanced machine learning\n'
      '\n 8GB of unified memory so everything you do is fast and fluid\n'
      '\n13.3-inch Retina display with P3 wide color for vibrant images and incredible detail³\n',
      'specifications':
      'Key Features\n'
          '\nOperating system:  WINDOWS 11 PRO - FINGERPRINT- KEYBOARD LIGHT \n'
          '\nMemory: 12GB DDRA RAM\n'
          '\nInternal drive: 512GB SSD\n'
          '\nMicroprocessor Intel® Celeron(up to 2.5 GHz with Intel® Turbo Boost Technology, 6 MB L3 cache, )\n'
          '\nGraphics: Integrated: INTEL FHD Crystal Clear Graphics \n'
          '\nWeight (kg): 1.77 \n'
          '\nHard drive 64GB SSD\n',
      'rating': 4.5,
      'reviewCount': 90,
      'price': '\$1500.00',
      'stock': 'In stock',
      'additionalImages': [
        'assets/Apple_1.jpg',
        'assets/Apple_2.png',
      ],
    },
    {
      'name': 'Acer TravelMate P2 TMP215-53-704M',
      'image': 'assets/acer_predator_2.png',
    'Brand': 'Brand: Hp | Similar products from Acer',
    'descr': 'Product details'
    '\n'
    '\nDELL LATITUDE 3190\n'
    '\nSuperior processing components\n'
    '\nPlay at your best with a 12th Gen Intel® Core™ processor 4, a modern graphics card, and plenty of memory\n'
    '\nSophisticated and refined design\n'
    '\nWith a smaller footprint and up to three colors options 5, this spritely device looks good anywhere.\n'
    '\nEvery feature you could need\n'
    '\nFrom the updated thermal design to the HD camera, this laptop has everything.\n'
    '\nExtend beyond performance to let your PC do even more at once Offering more than just a performance score. 12th Gen Intel® Core™ Processors advance real-world computing and deliver more ultra-efficient multi-tasking.\n',
    'specifications':
      'KEY FEATURES\n'
      '\nProcessor: 11th Generation, Intel Core i7-11657G Quad-Core\n'
      '\nMemory: 8GB DDR4 RAM\n'
      '\nStorage: 256GB Solid State Drive \n'
      '\nScreen: 15" 1920 x 1080 Full HD IPS Display\n'
      '\nmicroSDXC Media Card Reader\n'
      '\nUSB Type-A - HDMI - Thunderbolt 3\n'
      '\nWi-Fi 5 (802.11ac) - Gigabit Ethernet\n'
      '\nOperating System: Windows 10\n'
      'Specifications\n'
      '\nSKU: AC019CL29DPRQNAFAMZ\n'
      '\nProduct Line: Apex Street Accessories\n'
      '\nModel: Acer TravelMate P2 TMP215-53-704M\n'
      '\nProduction Country: China\n'
      '\nColor: BLACK\n',
      'rating': 4.3,
      'reviewCount': 65,
      'price': '\$4000.00',
      'stock': 'In stock',
      'additionalImages': [
        'assets/acer_predator_1.png',
        'assets/acer_predator_2.png',
        'assets/acer_predator_3.png',
        'assets/acer_predator_4.png',
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  // Starts a timer that automatically slides to the next image every 5 seconds.
  void _startAutoSlide() {
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imageList.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // Navigation functions.
  void _redirectToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage()),
    );
  }

  void _redirectToCategory(String category) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CategoryPage(selectedCategory: category)),
    );
  }

  void _redirectToAllCategories() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AllCategoryPage(categories: laptopModels)),
    );
  }

  void _redirectToProductDetail(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetailPage(product: product)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top header: "Discover" text on the left and responsive cart icon on the right.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart, size: 32, color: Colors.black),
                    onPressed: _redirectToCart,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Autocomplete search field.
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return laptopModels.where((String option) {
                    return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextField(
                    controller: fieldTextEditingController,
                    focusNode: fieldFocusNode,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  );
                },
                onSelected: (String selection) {
                  _redirectToCategory(selection);
                },
              ),
              SizedBox(height: 20),
              // Slider area for images.
              Container(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          border: Border.all(color: Colors.grey.shade300, width: 2),
                          image: DecorationImage(
                            image: AssetImage(imageList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              // Category row: "Category" on the left and "see all" on the right.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: _redirectToAllCategories,
                    child: Text(
                      "see all",
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Product showcase section: "Featured Laptops"
              Text(
                "Featured Laptops",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(height: 12),
              // Grid of 6 products, 2 columns.
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final product = products[index];
                  return GestureDetector(
                    onTap: () {
                      _redirectToProductDetail(product);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.asset(
                            product['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          product['name'],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        Text(
                          product['price'],
                          style: TextStyle(fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      // Sticky footer using BottomNavigationBar.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Welcome page is at index 0.
        onTap: (index) {
          if (index == 0) {
            // Home: Already on WelcomePage.
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("You are already on the home page!")),
            );
          } else if (index == 1) {
            // Category: Navigate to All Categories.
            _redirectToAllCategories();
          } else if (index == 2) {
            // User: Navigate to AccountPage.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPage()),
            );
          } else if (index == 3) {
            // Help: Navigate to CustomerCarePage.
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CustomerCarePage()),
            );
          }
        },
        selectedItemColor: Colors.blueAccent,  // Active icon color.
        unselectedItemColor: Colors.grey,        // Inactive icon color.
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Help",
          ),
        ],
      ),
    );
  }
}
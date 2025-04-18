import 'package:flutter/material.dart';
import 'gaming_detail_page.dart';

class GamingLaptopsPage extends StatefulWidget {
  @override
  _GamingLaptopsPageState createState() => _GamingLaptopsPageState();
}

class _GamingLaptopsPageState extends State<GamingLaptopsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;
  String _currentSort = 'default';

  final List<Map<String, dynamic>> gamingLaptops = [
    {
      'name': 'Razer Blade 15',
      'image': 'assets/game_images/game_1.jpg',
      'price': '\$2499',
      'rating': 4.9,
      'reviewCount': 325,
      'desc': 'Ultimate gaming laptop with NVIDIA GeForce RTX 4080, Intel Core i9 13th Gen. 32GB DDR5 RAM, 1TB PCIe SSD. 15.6-inch QHD 240Hz display with NVIDIA G-SYNC.',
      'specifications': '• Intel Core i9 13th Gen\n• 32GB DDR5 RAM\n• 1TB PCIe SSD\n• RTX 4080 16GB VRAM\n• 15.6" QHD 240Hz\n• Vapor Chamber Cooling',
      'additionalImages': [
        'assets/game_images/game_1.jpg',
        'assets/game_images/game_2.jpg',
        'assets/game_images/game_3.jpg',
      ],
    },
    {
      'name': 'Alienware x17 R2',
      'image': 'assets/game_images/game_4.jpg',
      'price': '\$2899',
      'rating': 4.8,
      'reviewCount': 289,
      'desc': 'Premium gaming powerhouse with NVIDIA GeForce RTX 4090, Intel Core i9-12900HK. 64GB DDR5 RAM, 2TB NVMe SSD. 17.3-inch UHD 120Hz display with Advanced Optimus.',
      'specifications': '• Intel i9-12900HK\n• 64GB DDR5 RAM\n• 2TB NVMe SSD\n• RTX 4090 24GB VRAM\n• 17.3" UHD 120Hz\n• Cryo-tech cooling',
      'additionalImages': [
        'assets/game_images/game_4.jpg',
        'assets/game_images/game_5.png',
        'assets/game_images/game_6.png',
      ],
    },
    {
      'name': 'ASUS ROG Zephyrus G14',
      'image': 'assets/game_images/game_7.png',
      'price': '\$1799',
      'rating': 4.7,
      'reviewCount': 412,
      'desc': 'Compact gaming marvel with AMD Ryzen 9 7940HS, NVIDIA GeForce RTX 4070. 32GB DDR5 RAM, 1TB PCIe SSD. 14-inch QHD+ 165Hz display with AMD FreeSync Premium Pro.',
      'specifications': '• Ryzen 9 7940HS\n• 32GB DDR5 RAM\n• 1TB PCIe SSD\n• RTX 4070 8GB VRAM\n• 14" QHD+ 165Hz\n• AniMe Matrix™ display',
      'additionalImages': [
        'assets/game_images/game_7.png',
        'assets/game_images/game_8.png',
        'assets/game_images/game_9.png',
      ],
    },
    {
      'name': 'MSI Titan GT77 HX',
      'image': 'assets/game_images/game_10.png',
      'price': '\$3499',
      'rating': 4.9,
      'reviewCount': 178,
      'desc': 'Desktop replacement with NVIDIA GeForce RTX 4090, Intel Core i9-13980HX. 128GB DDR5 RAM, 4TB NVMe SSD. 17.3-inch 4K 144Hz Mini LED display.',
      'specifications': '• Intel i9-13980HX\n• 128GB DDR5 RAM\n• 4TB NVMe SSD\n• RTX 4090 24GB VRAM\n• 17.3" 4K 144Hz\n• Cooler Boost Titan',
      'additionalImages': [
        'assets/game_images/game_10.png',
        'assets/game_images/game_11.png',
        'assets/game_images/game_12.png',
      ],
    },
    {
      'name': 'Lenovo Legion Pro 7i',
      'image': 'assets/game_images/game_14.png',
      'price': '\$2299',
      'rating': 4.6,
      'reviewCount': 245,
      'desc': 'Professional gaming laptop with NVIDIA GeForce RTX 4080, Intel Core i9-13900HX. 32GB DDR5 RAM, 2TB PCIe SSD. 16-inch WQXGA 240Hz display with G-SYNC.',
      'specifications': '• Intel i9-13900HX\n• 32GB DDR5 RAM\n• 2TB PCIe SSD\n• RTX 4080 12GB VRAM\n• 16" WQXGA 240Hz\n• Legion Coldfront 4.0',
      'additionalImages': [
        'assets/game_images/game_14.png',
        'assets/game_images/game_13.png',
        'assets/game_images/game_15.png',
      ],
    },
    {
      'name': 'Razer Blade 15',
      'image': 'assets/game_images/game_1.jpg',
      'price': '\$2499',
      'rating': 4.9,
      'reviewCount': 325,
      'desc': 'Ultimate gaming laptop with NVIDIA GeForce RTX 4080, Intel Core i9 13th Gen. 32GB DDR5 RAM, 1TB PCIe SSD. 15.6-inch QHD 240Hz display with NVIDIA G-SYNC.',
      'specifications': '• Intel Core i9 13th Gen\n• 32GB DDR5 RAM\n• 1TB PCIe SSD\n• RTX 4080 16GB VRAM\n• 15.6" QHD 240Hz\n• Vapor Chamber Cooling',
      'additionalImages': [
        'assets/game_images/game_1.jpg',
        'assets/game_images/game_2.jpg',
        'assets/game_images/game_3.jpg',
      ],
    },
    {
      'name': 'MSI Titan GT77 HX',
      'image': 'assets/game_images/game_10.png',
      'price': '\$3499',
      'rating': 4.9,
      'reviewCount': 178,
      'desc': 'Desktop replacement with NVIDIA GeForce RTX 4090, Intel Core i9-13980HX. 128GB DDR5 RAM, 4TB NVMe SSD. 17.3-inch 4K 144Hz Mini LED display.',
      'specifications': '• Intel i9-13980HX\n• 128GB DDR5 RAM\n• 4TB NVMe SSD\n• RTX 4090 24GB VRAM\n• 17.3" 4K 144Hz\n• Cooler Boost Titan',
      'additionalImages': [
        'assets/game_images/game_10.png',
        'assets/game_images/game_11.png',
        'assets/game_images/game_12.png',
      ],
    },
  ];

// [Previous code remains the same until gamingLaptops list]

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showFab = _scrollController.offset > 50;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _sortProducts(String sortType) {
    setState(() {
      switch (sortType) {
        case 'lowToHigh':
          gamingLaptops.sort((a, b) => _extractPrice(a['price'])
              .compareTo(_extractPrice(b['price'])));
          _currentSort = 'lowToHigh';
          break;
        case 'highToLow':
          gamingLaptops.sort((a, b) => _extractPrice(b['price'])
              .compareTo(_extractPrice(a['price'])));
          _currentSort = 'highToLow';
          break;
        default:
          _currentSort = 'default';
      }
    });
  }

  double _extractPrice(String price) {
    return double.parse(price.replaceAll('\$', ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gaming Laptops"),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Gaming Laptops'),
                  content: Text('High-performance gaming laptops with latest GPUs and processors for ultimate gaming experience.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Got it'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        controller: _scrollController,
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: gamingLaptops.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GamingDetailPage(
                    product: gamingLaptops[index],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        gamingLaptops[index]['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          gamingLaptops[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.red[800],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          gamingLaptops[index]['price'],
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 4),
                            Text(
                              gamingLaptops[index]['rating'].toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              ' (${gamingLaptops[index]['reviewCount']})',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _showFab ? 1.0 : 0.0,
        duration: Duration(milliseconds: 200),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.arrow_upward),
                        title: Text('Price: Low to High'),
                        selected: _currentSort == 'lowToHigh',
                        onTap: () {
                          _sortProducts('lowToHigh');
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.arrow_downward),
                        title: Text('Price: High to Low'),
                        selected: _currentSort == 'highToLow',
                        onTap: () {
                          _sortProducts('highToLow');
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.restore),
                        title: Text('Reset to Default'),
                        selected: _currentSort == 'default',
                        onTap: () {
                          _sortProducts('default');
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
          backgroundColor: Colors.red[800],
          child: Icon(Icons.filter_list),
          tooltip: 'Sort Products',
        ),
      ),
    );
  }
}


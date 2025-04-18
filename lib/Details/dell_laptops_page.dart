import 'package:flutter/material.dart';
import 'dell_detail_page.dart';

class DellLaptopsPage extends StatefulWidget {
  @override
  _DellLaptopsPageState createState() => _DellLaptopsPageState();
}

class _DellLaptopsPageState extends State<DellLaptopsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;
  String _currentSort = 'default';

  final List<Map<String, dynamic>> dellLaptops = [
    {
      'name': 'Dell XPS 13 Plus',
      'image': 'assets/dell_images/dell_1.png',
      'price': '\$1299',
      'rating': 4.8,
      'reviewCount': 245,
      'desc': 'Revolutionary design with 12th Gen Intel® Core™ processors, Intel® Iris® Xe Graphics. 16GB LPDDR5 RAM, 512GB SSD storage. 13.4-inch 4K OLED touch display. Zero-lattice keyboard with haptic feedback.',
      'specifications': '• 12th Gen Intel Core i7\n• 16GB RAM\n• 512GB SSD\n• 13.4-inch 4K OLED Display\n• Up to 13 hours battery life\n• Two Thunderbolt 4 ports',
      'additionalImages': [
        'assets/dell_images/dell_1.png',
        'assets/dell_images/dell_2.png',
        'assets/dell_images/dell_3.png',
      ],
    },
    {
      'name': 'Dell Precision 5570',
      'image': 'assets/dell_images/dell_4.png',
      'price': '\$2199',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Professional workstation with Intel® Core™ i9 processor, NVIDIA RTX A2000 Graphics. 32GB DDR5 RAM, 1TB NVMe SSD. 15.6-inch UHD+ display with HDR 400.',
      'specifications': '• Intel Core i9 processor\n• 32GB DDR5 RAM\n• 1TB NVMe SSD\n• 15.6-inch UHD+ display\n• NVIDIA RTX A2000\n• Four Thunderbolt 4 ports',
      'additionalImages': [
        'assets/dell_images/dell_4.png',
        'assets/dell_images/dell_5.png',
        'assets/dell_images/dell_6.png',
      ],
    },
    {
      'name': 'Dell Latitude 9430',
      'image': 'assets/dell_images/dell_7.png',
      'price': '\$1899',
      'rating': 4.7,
      'reviewCount': 156,
      'desc': 'Premium business laptop with Intel® vPro™ platform, Intel® Iris® Xe Graphics. 32GB LPDDR5 RAM, 1TB SSD. 14-inch QHD+ display with ComfortView Plus.',
      'specifications': '• Intel vPro platform\n• 32GB LPDDR5 RAM\n• 1TB SSD\n• 14-inch QHD+ display\n• Up to 16 hours battery\n• Advanced security features',
      'additionalImages': [
        'assets/dell_images/dell_7.png',
        'assets/dell_images/dell_8.png',
        'assets/dell_images/dell_9.png',
      ],
    },
    {
      'name': 'Dell Inspiron 16 Plus',
      'image': 'assets/dell_images/dell_10.png',
      'price': '\$1499',
      'rating': 4.6,
      'reviewCount': 178,
      'desc': 'Creative powerhouse with 12th Gen Intel® Core™ H-series processors, NVIDIA GeForce RTX 3060. 16GB DDR5 RAM, 1TB SSD. 16-inch 3K resolution display.',
      'specifications': '• 12th Gen Intel Core H-series\n• 16GB DDR5 RAM\n• 1TB SSD\n• 16-inch 3K display\n• NVIDIA RTX 3060\n• Thunderbolt 4 support',
      'additionalImages': [
        'assets/dell_images/dell_10.png',
        'assets/dell_images/dell_11.png',
        'assets/dell_images/dell_12.png',
      ],
    },
    {
      'name': 'Dell G15 Gaming',
      'image': 'assets/dell_images/dell_13.png',
      'price': '\$1299',
      'rating': 4.5,
      'reviewCount': 234,
      'desc': 'Gaming laptop with AMD Ryzen™ 7 processor, NVIDIA GeForce RTX 3070. 16GB DDR5 RAM, 1TB SSD. 15.6-inch FHD 165Hz display with G-SYNC.',
      'specifications': '• AMD Ryzen 7 processor\n• 16GB DDR5 RAM\n• 1TB SSD\n• 15.6-inch 165Hz display\n• NVIDIA RTX 3070\n• Advanced thermal design',
      'additionalImages': [
        'assets/dell_images/dell_13.png',
        'assets/dell_images/dell_14.png',
        'assets/dell_images/dell_15.png',
      ],
    },
    {
      'name': 'Dell G15 Gaming',
      'image': 'assets/dell_images/dell_16.png',
      'price': '\$1299',
      'rating': 4.5,
      'reviewCount': 234,
      'desc': 'Gaming laptop with AMD Ryzen™ 7 processor, NVIDIA GeForce RTX 3070. 16GB DDR5 RAM, 1TB SSD. 15.6-inch FHD 165Hz display with G-SYNC.',
      'specifications': '• AMD Ryzen 7 processor\n• 16GB DDR5 RAM\n• 1TB SSD\n• 15.6-inch 165Hz display\n• NVIDIA RTX 3070\n• Advanced thermal design',
      'additionalImages': [
        'assets/dell_images/dell_16.png',
        'assets/dell_images/dell_17.png',
      ],
    },
    {
      'name': 'Dell G15 Gaming',
      'image': 'assets/dell_images/dell_18.png',
      'price': '\$1299',
      'rating': 4.5,
      'reviewCount': 234,
      'desc': 'Gaming laptop with AMD Ryzen™ 7 processor, NVIDIA GeForce RTX 3070. 16GB DDR5 RAM, 1TB SSD. 15.6-inch FHD 165Hz display with G-SYNC.',
      'specifications': '• AMD Ryzen 7 processor\n• 16GB DDR5 RAM\n• 1TB SSD\n• 15.6-inch 165Hz display\n• NVIDIA RTX 3070\n• Advanced thermal design',
      'additionalImages': [
        'aassets/dell_images/dell_18.png',
        'assets/dell_images/dell_19.png',
      ],
    },
    {
      'name': 'Dell G15 Gaming',
      'image': 'assets/dell_images/dell_2.png',
      'price': '\$1299',
      'rating': 4.5,
      'reviewCount': 234,
      'desc': 'Gaming laptop with AMD Ryzen™ 7 processor, NVIDIA GeForce RTX 3070. 16GB DDR5 RAM, 1TB SSD. 15.6-inch FHD 165Hz display with G-SYNC.',
      'specifications': '• AMD Ryzen 7 processor\n• 16GB DDR5 RAM\n• 1TB SSD\n• 15.6-inch 165Hz display\n• NVIDIA RTX 3070\n• Advanced thermal design',
      'additionalImages': [
        'assets/dell_images/dell_2.png',
        'assets/dell_images/dell_3.png',
      ],
    },
    {
      'name': 'Dell G15 Gaming',
      'image': 'assets/dell_images/dell_7.png',
      'price': '\$1299',
      'rating': 4.5,
      'reviewCount': 234,
      'desc': 'Gaming laptop with AMD Ryzen™ 7 processor, NVIDIA GeForce RTX 3070. 16GB DDR5 RAM, 1TB SSD. 15.6-inch FHD 165Hz display with G-SYNC.',
      'specifications': '• AMD Ryzen 7 processor\n• 16GB DDR5 RAM\n• 1TB SSD\n• 15.6-inch 165Hz display\n• NVIDIA RTX 3070\n• Advanced thermal design',
      'additionalImages': [
        'assets/dell_images/dell_7.png',
        'assets/dell_images/dell_9.png',
      ],
    },
  ];

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
          dellLaptops.sort((a, b) => _extractPrice(a['price'])
              .compareTo(_extractPrice(b['price'])));
          _currentSort = 'lowToHigh';
          break;
        case 'highToLow':
          dellLaptops.sort((a, b) => _extractPrice(b['price'])
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
        title: Text("Dell Laptops"),
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
        itemCount: dellLaptops.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DellDetailPage(
                    product: dellLaptops[index],
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
                        dellLaptops[index]['image'],
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
                          dellLaptops[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          dellLaptops[index]['price'],
                          style: TextStyle(
                            color: Colors.blue,
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
                              dellLaptops[index]['rating'].toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
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
          child: Icon(Icons.filter_list),
          tooltip: 'Sort Products',
        ),
      ),
    );
  }
}

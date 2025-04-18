import 'package:flutter/material.dart';
import 'apple_detail_page.dart';

class AppleLaptopsPage extends StatefulWidget {
  @override
  _AppleLaptopsPageState createState() => _AppleLaptopsPageState();
}

class _AppleLaptopsPageState extends State<AppleLaptopsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showFab = false;
  String _currentSort = 'default';

  final List<Map<String, dynamic>> appleLaptops = [
    {
      'name': 'MacBook Air 1th Generation',
      'image': 'assets/Apple_images/mac_1.png',
      'price': '\$999',
      'rating': 4.8,
      'reviewCount': 245,
      'desc': 'Apple M1 chip with 8‑core CPU, 7‑core GPU, 16‑core Neural Engine. 8GB unified memory, 256GB SSD storage. 13.3-inch Retina display with True Tone. Magic Keyboard with Touch ID. Force Touch trackpad.',
      'specifications': '• Apple M1 chip\n• 8GB RAM\n• 256GB SSD\n• 13.3-inch Retina Display\n• Up to 18 hours battery life\n• Two Thunderbolt / USB 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_1.png',
        'assets/Apple_images/mac_2.png',
      ],
    },
    {
      'name': 'MacBook Pro 4th Generation"',
      'image': 'assets/Apple_images/mac_3.png',
      'price': '\$1999',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Apple M1 Pro chip with 8-core CPU, 14-core GPU, 16-core Neural Engine. 16GB unified memory, 512GB SSD storage. 14-inch Liquid Retina XDR display. Magic Keyboard with Touch ID.',
      'specifications': '• M1 Pro chip\n• 16GB RAM\n• 512GB SSD\n• 14-inch Liquid Retina XDR display\n• Up to 17 hours battery life\n• Three Thunderbolt 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_3.png',
        'assets/Apple_images/mac_4.png',
        'assets/Apple_images/mac_5.png',
      ],
    },
    {
      'name': 'MacBook Air 11"',
      'image': 'assets/Apple_images/mac_7.png',
      'price': '\$1999',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Apple M1 Pro chip with 8-core CPU, 14-core GPU, 16-core Neural Engine. 16GB unified memory, 512GB SSD storage. 14-inch Liquid Retina XDR display. Magic Keyboard with Touch ID.',
      'specifications': '• M1 Pro chip\n• 16GB RAM\n• 512GB SSD\n• 14-inch Liquid Retina XDR display\n• Up to 17 hours battery life\n• Three Thunderbolt 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_7.png',
        'assets/Apple_images/mac_6.png',
      ],
    },
    {
      'name': 'MacBook Pro 15"',
      'image': 'assets/Apple_images/mac_10.png',
      'price': '\$1999',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Apple M1 Pro chip with 8-core CPU, 14-core GPU, 16-core Neural Engine. 16GB unified memory, 512GB SSD storage. 14-inch Liquid Retina XDR display. Magic Keyboard with Touch ID.',
      'specifications': '• M1 Pro chip\n• 16GB RAM\n• 512GB SSD\n• 14-inch Liquid Retina XDR display\n• Up to 17 hours battery life\n• Three Thunderbolt 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_10.png',
        'assets/Apple_images/mac_9.png',
        'assets/Apple_images/mac_8.png',
      ],
    },
    {
      'name': 'MacBook Air 2022"',
      'image': 'assets/Apple_images/mac_11.png',
      'price': '\$1999',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Apple M1 Pro chip with 8-core CPU, 14-core GPU, 16-core Neural Engine. 16GB unified memory, 512GB SSD storage. 14-inch Liquid Retina XDR display. Magic Keyboard with Touch ID.',
      'specifications': '• M1 Pro chip\n• 16GB RAM\n• 512GB SSD\n• 14-inch Liquid Retina XDR display\n• Up to 17 hours battery life\n• Three Thunderbolt 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_11.png',
        'assets/Apple_images/mac_4.png',
      ],
    },
    {
      'name': 'MacBook Air 5th Generation"',
      'image': 'assets/Apple_images/mac_12.png',
      'price': '\$1999',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Apple M1 Pro chip with 8-core CPU, 14-core GPU, 16-core Neural Engine. 16GB unified memory, 512GB SSD storage. 14-inch Liquid Retina XDR display. Magic Keyboard with Touch ID.',
      'specifications': '• M1 Pro chip\n• 16GB RAM\n• 512GB SSD\n• 14-inch Liquid Retina XDR display\n• Up to 17 hours battery life\n• Three Thunderbolt 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_12.png',
        'assets/Apple_images/mac_13.png',
      ],
    },
    {
      'name': 'MacBook Air 18"',
      'image': 'assets/Apple_images/mac_14.png',
      'price': '\$1999',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Apple M1 Pro chip with 8-core CPU, 14-core GPU, 16-core Neural Engine. 16GB unified memory, 512GB SSD storage. 14-inch Liquid Retina XDR display. Magic Keyboard with Touch ID.',
      'specifications': '• M1 Pro chip\n• 16GB RAM\n• 512GB SSD\n• 14-inch Liquid Retina XDR display\n• Up to 17 hours battery life\n• Three Thunderbolt 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_14.png',
        'assets/Apple_2.png',
      ],
    },

    {
      'name': 'MacBook Pro 14th Generation"',
      'image': 'assets/Apple_images/mac_8.png',
      'price': '\$1999',
      'rating': 4.9,
      'reviewCount': 189,
      'desc': 'Apple M1 Pro chip with 8-core CPU, 14-core GPU, 16-core Neural Engine. 16GB unified memory, 512GB SSD storage. 14-inch Liquid Retina XDR display. Magic Keyboard with Touch ID.',
      'specifications': '• M1 Pro chip\n• 16GB RAM\n• 512GB SSD\n• 14-inch Liquid Retina XDR display\n• Up to 17 hours battery life\n• Three Thunderbolt 4 ports',
      'additionalImages': [
        'assets/Apple_images/mac_8.png',
        'assets/Apple_images/mac_10.png',
        'assets/Apple_images/mac_9.png',
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
          appleLaptops.sort((a, b) => _extractPrice(a['price'])
              .compareTo(_extractPrice(b['price'])));
          _currentSort = 'lowToHigh';
          break;
        case 'highToLow':
          appleLaptops.sort((a, b) => _extractPrice(b['price'])
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
        title: Text("Apple Laptops"),
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
        itemCount: appleLaptops.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppleDetailPage(
                    product: appleLaptops[index],
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
                        appleLaptops[index]['image'],
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
                          appleLaptops[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 4),
                        Text(
                          appleLaptops[index]['price'],
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
                              appleLaptops[index]['rating'].toString(),
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

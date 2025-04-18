import 'package:flutter/material.dart';
import 'package:demo/main_Component/cart_page.dart';
import 'package:demo/main_Component/cart_manager.dart';
class GamingDetailPage extends StatefulWidget {
  final Map<String, dynamic> product;

  const GamingDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  _GamingDetailPageState createState() => _GamingDetailPageState();
}

class _GamingDetailPageState extends State<GamingDetailPage> {
  int _currentImageIndex = 0;
  double _userRating = 0;
  final TextEditingController _reviewController = TextEditingController();

  final List<Map<String, dynamic>> reviews = [
    {
      'username': 'ProGamer2023',
      'rating': 4.8,
      'comment': 'Beast of a machine! Runs all AAA titles at max settings. The cooling system is impressive.',
      'date': '2023-10-15',
      'verified': true,
      'gamingHours': 156,
    },
    {
      'username': 'StreamerElite',
      'rating': 5.0,
      'comment': 'Perfect for streaming and gaming. No lag, no throttling, just pure performance.',
      'date': '2023-10-14',
      'verified': true,
      'gamingHours': 230,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product['name']),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.compare),
            onPressed: () {
              _showSpecComparison();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Gallery with Performance Indicators
            Stack(
              children: [
                Container(
                  height: 300,
                  child: PageView.builder(
                    itemCount: widget.product['additionalImages'].length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        widget.product['additionalImages'][index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.speed, color: Colors.red),
                        SizedBox(width: 4),
                        Text(
                          'High Performance',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Image Indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.product['additionalImages'].length,
                    (index) => Container(
                  margin: EdgeInsets.all(4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? Colors.red
                        : Colors.grey,
                  ),
                ),
              ),
            ),

            // Product Details
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product['name'],
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product['price'],
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildPerformanceIndicator(),
                    ],
                  ),

                  // Gaming Performance Metrics
                  _buildPerformanceMetrics(),

                  Divider(height: 32),

                  // Description
                  Text(
                    'Game Ready Specs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(widget.product['desc']),

                  Divider(height: 32),

                  // Detailed Specifications
                  Text(
                    'Technical Specifications',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  ),
                  SizedBox(height: 8),
                  _buildDetailedSpecs(),

                  Divider(height: 32),

                  // Gamer Reviews Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gamer Reviews',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red[800],
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () => _showReviewDialog(),
                        icon: Icon(Icons.gamepad),
                        label: Text('Add Review'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red[800],
                        ),
                      ),
                    ],
                  ),

                  // Reviews List
                  _buildReviewsList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          CartManager.addProduct(widget.product);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Added to cart successfully!'),
                ],
              ),
              action: SnackBarAction(
                label: 'VIEW CART',
                textColor: Colors.yellow,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
              backgroundColor: Colors.red[800],
              duration: Duration(seconds: 2),
            ),
          );
        },
        label: Text('Add to Cart'),
        icon: Icon(Icons.shopping_cart),
        backgroundColor: Colors.red[800],
      ),

    );
  }

  Widget _buildPerformanceIndicator() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(Icons.flash_on, color: Colors.yellow),
          SizedBox(width: 4),
          Text(
            'Gaming Beast',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceMetrics() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gaming Performance',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            _buildMetricRow('FPS in AAA Games', '120+ FPS'),
            _buildMetricRow('Ray Tracing', 'Enabled'),
            _buildMetricRow('DLSS Support', 'Yes'),
            _buildMetricRow('Cooling Efficiency', 'Advanced'),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedSpecs() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.product['specifications']
              .split('\n')
              .map<Widget>((spec) => Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 20),
                SizedBox(width: 8),
                Expanded(child: Text(spec)),
              ],
            ),
          ))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildReviewsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_outline, color: Colors.red[800]),
                        SizedBox(width: 8),
                        Text(
                          reviews[index]['username'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (reviews[index]['verified'])
                          Padding(
                            padding: EdgeInsets.only(left: 8),
                            child: Icon(Icons.verified_user,
                                color: Colors.green, size: 16),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 18),
                        Text(' ${reviews[index]['rating']}'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(reviews[index]['comment']),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reviews[index]['date'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${reviews[index]['gamingHours']} gaming hours',
                      style: TextStyle(
                        color: Colors.red[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showReviewDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.gamepad, color: Colors.red[800]),
            SizedBox(width: 8),
            Text('Write a Gamer Review'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _userRating ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      _userRating = index + 1;
                    });
                  },
                );
              }),
            ),
            TextField(
              controller: _reviewController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Share your gaming experience...',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                reviews.insert(0, {
                  'username': 'You',
                  'rating': _userRating,
                  'comment': _reviewController.text,
                  'date': DateTime.now().toString().substring(0, 10),
                  'verified': true,
                  'gamingHours': 0,
                });
              });
              Navigator.pop(context);
              _reviewController.clear();
              _userRating = 0;
            },
            child: Text('Submit'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red[800],
            ),
          ),
        ],
      ),
    );
  }

  void _showSpecComparison() {
    // Implement specs comparison functionality
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Compare Specs'),
        content: Text('Specs comparison feature coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

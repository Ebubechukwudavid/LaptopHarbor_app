import 'package:flutter/material.dart';
import 'main_Component/welcome_page.dart';
import 'functions/slide_button.dart'; // Import the custom SlideButton if it's in a separate file.

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // No AppBar to let the background image cover the entire screen.
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Title Text (H1 style)
                Text(
                  "LAPTOP HARBOR",
                  style: TextStyle(
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                // Paragraph 1
                Text(
                  "Power Up with the Best Laptops! Top Brands, Best Deals, Fast Delivery! Shop Now!",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                // Paragraph 2
                Text(
                  "Limited stock available! Get the perfect laptop for work, gaming, or creativity—delivered to your doorstep fast!",
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 32),
                // Custom Slide Button
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 60,
                  child: SlideButton(
                    onSlideComplete: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

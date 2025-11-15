import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone_november_2025/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone_november_2025/core/configs/assets/app_images.dart';
import 'package:spotify_clone_november_2025/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone_november_2025/core/configs/theme/app_colors.dart';
import 'package:spotify_clone_november_2025/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(AppImages.introBG),
              ),
            ),
          ),
          Container(color: Colors.black.withOpacity(0.15)),
          Column(
            children: [
              SizedBox(height: 20),
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(AppVectors.logo),
              ),
              Spacer(),
              Text(
                'Enjoy Listening To Music',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grey,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: BasicAppButton(
                  title: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChooseModePage();
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 50),
            ],

          ),
        ],
      ),
    );
  }
}

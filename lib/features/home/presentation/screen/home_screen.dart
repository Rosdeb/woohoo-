import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/components/IOSTappEffect/iosTapEffect.dart';
import 'package:deeraj/core/constants/app_constants.dart';
import 'package:deeraj/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/components/WoohooLogo/woohooLogo.dart';
import '../../../../core/theme/app_color.dart';
import '../widgets/ChallengeProgressBar.dart';
import '../widgets/TopPickCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F110C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IosTapEffect(
                    onTap: () {
                      context.push(AppPath.profile_screen);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1D1F),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primary, width: 1.5),
                      ),
                      child: const Center(
                        child: Icon(Icons.person, color: AppColors.primary, size: 24),
                      ),
                    ),
                  ),
                  const WoohooLogo(),
                  IosTapEffect(
                    onTap: (){
                      context.push(AppPath.notification);
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration:BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: AppColors.grey,
                          width: 1.5,
                        )
                      ),
                      child: Stack(
                        children: [
                          const Icon(Icons.notifications_outlined, color: AppColors.white),
                          Positioned(
                            right: 3,
                            top: -3,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(color: AppColors.orange, shape: BoxShape.circle),
                              child: const Text('3', style: TextStyle(fontSize: 8, color: AppColors.black)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Location Selector
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1D1F),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on, color: Color(0xFFA6FF4D), size: 18),
                    SizedBox(width: 4),
                    Text('Fitzroy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    Icon(Icons.keyboard_arrow_down, color: Colors.white54),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const ChallengeProgressBar(),
              const SizedBox(height: 20),

              // Map View Placeholder
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1D1F),
                  borderRadius: BorderRadius.circular(24),
                  image: const DecorationImage(
                    image: AssetImage('assets/map_placeholder.png'), // Add your grid image
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange, width: 2),
                    ),
                    child: const Text('DINNER - 7PM', style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              const AppText('TOP PICKS NEAR YOU', style: TextStyle(color: Colors.white54, fontSize: 12, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),

              SizedBox(
                height: 140,
                child: Row(
                  children: [
                    const Expanded(child: TopPickCard(title: 'Bar Lune', location: 'Fitzroy - 0.8km', category: 'Cocktails - Late')),
                    const SizedBox(width: 15,),
                    Expanded(
                      child: IosTapEffect(
                        onTap: () {
                          context.push(AppPath.tipooo_screen);
                        },
                        child: const TopPickCard(title: 'Tipo 00', location: 'Fitzroy - 1.2km', category: 'Italian - Dinner'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        shape: const CircleBorder(),
        backgroundColor:  AppColors.primary,
        child: const Icon(Icons.add, color: Colors.black, size: 30),
      ),
    );
  }
}
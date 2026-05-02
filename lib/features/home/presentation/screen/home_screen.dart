import 'dart:ui' as ui;
import 'package:deeraj/core/components/AppText/appText.dart';
import 'package:deeraj/core/components/IOSTappEffect/iosTapEffect.dart';
import 'package:deeraj/core/constants/app_constants.dart';
import 'package:deeraj/core/router/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/components/WoohooLogo/woohooLogo.dart';
import '../../../../core/theme/app_color.dart';
import '../../data/models/map_user.dart';
import '../../data/providers/map_provider.dart';
import '../VenueDetails/screen/venue_detail_screen.dart';
import '../widgets/ChallengeProgressBar.dart';
import '../widgets/TopPickCard.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  GoogleMapController? _mapController;
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _buildMarkers());
  }

  Future<BitmapDescriptor> _buildAvatarMarker(MapUser user) async {
    const size = 80.0;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    // Outer ring
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      size / 2,
      Paint()..color = Colors.black,
    );

    // Colored fill
    canvas.drawCircle(
      const Offset(size / 2, size / 2),
      (size / 2) - 3,
      Paint()..color = user.color,
    );

    // Initial text
    final tp = TextPainter(
      text: TextSpan(
        text: user.initial,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
      canvas,
      Offset((size - tp.width) / 2, (size - tp.height) / 2),
    );

    final img = await recorder.endRecording().toImage(size.toInt(), size.toInt());
    final bytes = await img.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }

  Future<void> _buildMarkers() async {
    final users = ref.read(mapUsersProvider);
    final Set<Marker> markers = {};

    for (final user in users) {
      final icon = await _buildAvatarMarker(user);
      markers.add(Marker(
        markerId: MarkerId(user.id),
        position: LatLng(user.lat, user.lng),
        icon: icon,
        onTap: () {},
      ));
    }

    // Dinner label marker
    markers.add(const Marker(
      markerId: MarkerId('dinner_label'),
      position: LatLng(37.7749, -122.4194),
    ));

    if (mounted) setState(() => _markers = markers);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Stack(
                    children: [
                      GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(37.7749, -122.4194),
                          zoom: 14,
                        ),
                        onMapCreated: (c) {
                          _mapController = c;
                          // Dark map style
                          _mapController?.setMapStyle(_darkMapStyle);
                        },
                        markers: _markers,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        compassEnabled: false,
                        mapToolbarEnabled: false,
                      ),

                      // DINNER pill — tappable → opens venue detail
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: GestureDetector(
                            onTap: () {
                              final venue = ref
                                  .read(mapRepositoryProvider)
                                  .fetchVenueDetail('1');
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (_) => SizedBox(
                                  height:
                                  MediaQuery.of(context).size.height * 0.88,
                                  child: VenueDetailScreen(venue: venue),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                    color: AppColors.orange, width: 2),
                              ),
                              child: Text(
                                'DINNER - 7PM',
                                style: TextStyle(
                                  color: AppColors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF141414),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF242424),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Select activities...',
                        style: TextStyle(
                          color: Color(0xFF9A9A9A),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Color(0xFF9A9A9A),
                      size: 20,
                    ),
                  ],
                ),
              ),

              SizedBox(height: size.height * 0.02),
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
              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }

}

const String _darkMapStyle = '''
[
  {"elementType": "geometry", "stylers": [{"color": "#1a1a2e"}]},
  {"elementType": "labels.text.fill", "stylers": [{"color": "#746855"}]},
  {"elementType": "labels.text.stroke", "stylers": [{"color": "#242f3e"}]},
  {"featureType": "road", "elementType": "geometry", "stylers": [{"color": "#2c2c3e"}]},
  {"featureType": "road", "elementType": "geometry.stroke", "stylers": [{"color": "#212a37"}]},
  {"featureType": "water", "elementType": "geometry", "stylers": [{"color": "#17263c"}]},
  {"featureType": "poi", "stylers": [{"visibility": "off"}]},
  {"featureType": "transit", "stylers": [{"visibility": "off"}]}
]
''';

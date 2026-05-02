import 'package:deeraj/core/components/WoohooLogo/woohooLogo.dart';
import 'package:deeraj/core/theme/app_color.dart';
import 'package:deeraj/features/discovery/data/providers/discovery_provider.dart';
import 'package:deeraj/features/discovery/data/repository/discovery_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DiscoveryScreen extends ConsumerStatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  ConsumerState<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends ConsumerState<DiscoveryScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider);
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final featured = ref.watch(featuredVenuesProvider);
    final nearby = ref.watch(nearbyVenuesProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // ── Header ────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 40),
                    const WoohooLogo(),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A1A),
                        shape: BoxShape.circle,
                        border:
                        Border.all(color: const Color(0xFF2A2A2A)),
                      ),
                      child: const Icon(Icons.tune_rounded,
                          color: Colors.white70, size: 20),
                    ),
                  ],
                ),
              ),
            ),

            // ── Title ─────────────────────────────────────────
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 4, 20, 16),
                child: Text(
                  'Discover',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ),

            // ── Search bar ────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFF161616),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                        color: const Color(0xFF2A2A2A), width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 14),
                      const Icon(Icons.search_rounded,
                          color: Colors.white38, size: 20),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          onChanged: (v) => ref
                              .read(discoverySearchQueryProvider.notifier)
                              .state = v,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          decoration: const InputDecoration(
                            hintText: 'Venues, areas, vibes...',
                            hintStyle: TextStyle(
                                color: Colors.white38, fontSize: 14),
                            border: InputBorder.none,
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // ── Category chips ────────────────────────────────
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (_, i) {
                    final cat = categories[i];
                    final isSelected = selectedCategory == cat.id;
                    return GestureDetector(
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .state = cat.id,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFA8FF3E)
                              : const Color(0xFF161616),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? const Color(0xFFA8FF3E)
                                : const Color(0xFF2A2A2A),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              cat.icon,
                              size: 14,
                              color: isSelected
                                  ? Colors.black
                                  : Colors.white54,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              cat.label,
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.black
                                    : Colors.white54,
                                fontSize: 12,
                                fontWeight: isSelected
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),

            // ── Featured label ────────────────────────────────
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'FEATURED TONIGHT',
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            // ── Featured horizontal scroll ─────────────────────
            SliverToBoxAdapter(
              child: SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const BouncingScrollPhysics(),
                  itemCount: featured.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) =>
                      _FeaturedCard(venue: featured[i]),
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 28)),

            // ── Nearby label ──────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'NEAR YOU',
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Text(
                      '${nearby.length} places',
                      style: const TextStyle(
                        color: Colors.white24,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 12)),

            // ── Nearby list ───────────────────────────────────
            nearby.isEmpty
                ? const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'No venues found',
                    style: TextStyle(
                        color: Colors.white38, fontSize: 14),
                  ),
                ),
              ),
            )
                : SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (_, i) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _NearbyTile(venue: nearby[i]),
                  ),
                  childCount: nearby.length,
                ),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 30)),
          ],
        ),
      ),
    );
  }
}

// ── Featured Card ──────────────────────────────────────────────────────────────

class _FeaturedCard extends StatelessWidget {
  final DiscoveryVenue venue;
  const _FeaturedCard({required this.venue});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: venue.accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            venue.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: venue.accentColor),
          ),

          // Gradient scrim
          DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.85),
                ],
                stops: const [0.35, 1.0],
              ),
            ),
          ),

          // Badge top-left
          if (venue.isHot || venue.isNew)
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: venue.isHot
                      ? AppColors.orange
                      : const Color(0xFFA8FF3E),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  venue.isHot ? '🔥 HOT' : '✨ NEW',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),

          // Bottom content
          Positioned(
            left: 12,
            right: 12,
            bottom: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  venue.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  venue.category,
                  style: const TextStyle(
                    color: Colors.white60,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star_rounded,
                        color: Color(0xFFA8FF3E), size: 13),
                    const SizedBox(width: 3),
                    Text(
                      venue.rating.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.people_alt_rounded,
                        color: Colors.white54, size: 13),
                    const SizedBox(width: 3),
                    Text(
                      '${venue.goingCount}',
                      style: const TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Nearby Tile ────────────────────────────────────────────────────────────────

class _NearbyTile extends StatelessWidget {
  final DiscoveryVenue venue;
  const _NearbyTile({required this.venue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF141414),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF222222), width: 1),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // Thumbnail
          SizedBox(
            width: 80,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  venue.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(color: venue.accentColor),
                ),
                if (venue.isHot || venue.isNew)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 2),
                      decoration: BoxDecoration(
                        color: venue.isHot
                            ? AppColors.orange
                            : const Color(0xFFA8FF3E),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        venue.isHot ? '🔥' : '✨',
                        style: const TextStyle(fontSize: 9),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          venue.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1E1E1E),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          venue.distance,
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 11,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    venue.category,
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star_rounded,
                          color: Color(0xFFA8FF3E), size: 12),
                      const SizedBox(width: 3),
                      Text(
                        venue.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.people_alt_rounded,
                          color: Colors.white38, size: 12),
                      const SizedBox(width: 3),
                      Text(
                        '${venue.goingCount} going',
                        style: const TextStyle(
                          color: Colors.white38,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Arrow
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E1E),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white38,
                size: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
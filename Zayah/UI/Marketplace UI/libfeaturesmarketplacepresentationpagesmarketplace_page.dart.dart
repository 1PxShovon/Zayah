import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/marketplace_cubit.dart';
import '../widgets/category_grid.dart';

class MarketplacePage extends StatefulWidget {
  const MarketplacePage({super.key});

  @override
  State<MarketplacePage> createState() => _MarketplacePageState();
}

class _MarketplacePageState extends State<MarketplacePage> {

  @override
  void initState() {
    super.initState();
    context.read<MarketplaceCubit>().loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marketplace"),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            context.read<MarketplaceCubit>().refresh(),
        child: BlocBuilder<
            MarketplaceCubit,
            MarketplaceState>(
          builder: (context, state) {

            if (state is MarketplaceLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is MarketplaceError) {
              return Center(
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [

                    const Icon(
                      Icons.error_outline,
                      size: 60,
                    ),

                    const SizedBox(height: 16),

                    Text(state.message),

                    const SizedBox(height: 16),

                    ElevatedButton(
                      onPressed: () {
                        context
                            .read<MarketplaceCubit>()
                            .loadCategories();
                      },
                      child: const Text("Retry"),
                    ),
                  ],
                ),
              );
            }

            if (state is MarketplaceLoaded) {

              if (state.categories.isEmpty) {
                return const Center(
                  child: Text(
                    "No Categories Available",
                  ),
                );
              }

              return SingleChildScrollView(
                physics:
                    const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.all(16),
                child: CategoryGrid(
                  categories: state.categories,
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
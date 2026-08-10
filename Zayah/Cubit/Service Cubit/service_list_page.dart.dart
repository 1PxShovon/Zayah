import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/service_cubit.dart';

class ServiceListPage extends StatefulWidget {
  final String? categoryId;

  const ServiceListPage({
    super.key,
    this.categoryId,
  });

  @override
  State<ServiceListPage> createState() =>
      _ServiceListPageState();
}

class _ServiceListPageState
    extends State<ServiceListPage> {

  @override
  void initState() {
    super.initState();

    context.read<ServiceCubit>().loadServices(
          categoryId: widget.categoryId,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
      ),
      body: BlocBuilder<ServiceCubit, ServiceState>(
        builder: (context, state) {

          if (state is ServiceLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is ServiceError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is ServiceLoaded) {
            return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (_, index) {

                final service = state.services[index];

                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: service.images.isNotEmpty
                        ? Image.network(
                            service.images.first,
                            width: 60,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image),

                    title: Text(service.title),

                    subtitle: Text(
                      "${service.price} ${service.currency}",
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),

                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        "/service-details",
                        arguments: service.id,
                      );
                    },
                  ),
                );
              },
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
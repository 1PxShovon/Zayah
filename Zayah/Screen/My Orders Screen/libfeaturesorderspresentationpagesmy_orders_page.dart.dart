import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controllers/order_cubit.dart';
import '../../domain/entities/order.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({super.key});

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {

  @override
  void initState() {
    super.initState();

    // TODO:
    // Replace with authenticated user id
    context.read<OrderCubit>().loadOrders(
      customerId: "CURRENT_USER_ID",
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("My Orders"),
      ),

      body: BlocBuilder<OrderCubit, OrderState>(

        builder: (context, state) {

          if (state is OrderLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is OrderError) {
            return Center(
              child: Text(state.message),
            );
          }

          if (state is OrderLoaded) {

            if (state.orders.isEmpty) {
              return const Center(
                child: Text(
                  "No Orders Found",
                ),
              );
            }

            return ListView.builder(

              itemCount: state.orders.length,

              itemBuilder: (_, index) {

                final Order order =
                    state.orders[index];

                return Card(

                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: ListTile(

                    leading: CircleAvatar(
                      child: Text(
                        "${index + 1}",
                      ),
                    ),

                    title: Text(
                      "Order #${order.id}",
                    ),

                    subtitle: Text(
                      order.status.name,
                    ),

                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                    ),

                    onTap: () {

                      Navigator.pushNamed(
                        context,
                        "/order-details",
                        arguments: order.id,
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
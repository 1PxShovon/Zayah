import 'package:flutter/material.dart';

import '../../../../shared/widgets/zayah_primary_button.dart';
import '../../domain/entities/checkout_address.dart';
import '../controllers/checkout_controller.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({
    required this.controller,
    super.key,
  });

  final CheckoutController controller;

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  final _area = TextEditingController();
  final _block = TextEditingController();
  final _street = TextEditingController();
  final _building = TextEditingController();
  final _floor = TextEditingController();
  final _notes = TextEditingController();

  @override
  void dispose() {
    _area.dispose();
    _block.dispose();
    _street.dispose();
    _building.dispose();
    _floor.dispose();
    _notes.dispose();
    widget.controller.dispose();
    super.dispose();
  }

  String? _required(String? value) {
    if ((value ?? '').trim().isEmpty) {
      return 'Required';
    }
    return null;
  }

  CheckoutAddress _address() {
    return CheckoutAddress(
      area: _area.text.trim(),
      block: _block.text.trim(),
      street: _street.text.trim(),
      building: _building.text.trim(),
      floor: _floor.text.trim().isEmpty ? null : _floor.text.trim(),
      notes: _notes.text.trim().isEmpty ? null : _notes.text.trim(),
    );
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final success = await widget.controller.submit(_address());
    if (!mounted) {
      return;
    }

    if (success) {
      final id = widget.controller.pendingOrderId ?? 'pending';
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Pending order created'),
          content: Text(
            'Order $id is ready for payment initialization. '
            'The production KNET backend will replace the in-memory repository.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Done'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        final summary = widget.controller.summary;

        return Scaffold(
          appBar: AppBar(title: const Text('Checkout')),
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: <Widget>[
                    Text(
                      'Service address',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _area,
                            decoration: const InputDecoration(
                              labelText: 'Area',
                            ),
                            validator: _required,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: _block,
                                  decoration: const InputDecoration(
                                    labelText: 'Block',
                                  ),
                                  validator: _required,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextFormField(
                                  controller: _street,
                                  decoration: const InputDecoration(
                                    labelText: 'Street',
                                  ),
                                  validator: _required,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: TextFormField(
                                  controller: _building,
                                  decoration: const InputDecoration(
                                    labelText: 'Building',
                                  ),
                                  validator: _required,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: TextFormField(
                                  controller: _floor,
                                  decoration: const InputDecoration(
                                    labelText: 'Floor (optional)',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _notes,
                            maxLines: 3,
                            decoration: const InputDecoration(
                              labelText: 'Notes (optional)',
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Order summary',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: <Widget>[
                            for (final item in summary.items)
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(item.name),
                                subtitle: Text('Quantity: ${item.quantity}'),
                                trailing: Text(
                                  '${item.total.toStringAsFixed(3)} '
                                  '${summary.currency}',
                                ),
                              ),
                            const Divider(),
                            _AmountRow(
                              label: 'Subtotal',
                              amount:
                                  '${summary.subtotal.toStringAsFixed(3)} '
                                  '${summary.currency}',
                            ),
                            _AmountRow(
                              label: 'Service fee',
                              amount:
                                  '${summary.serviceFee.toStringAsFixed(3)} '
                                  '${summary.currency}',
                            ),
                            const Divider(),
                            _AmountRow(
                              label: 'Total',
                              amount:
                                  '${summary.total.toStringAsFixed(3)} '
                                  '${summary.currency}',
                              emphasize: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.controller.errorMessage != null) ...<Widget>[
                      const SizedBox(height: 12),
                      Text(
                        widget.controller.errorMessage!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    ZayahPrimaryButton(
                      label: 'Continue to payment',
                      isLoading: widget.controller.isSubmitting,
                      onPressed: _submit,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _AmountRow extends StatelessWidget {
  const _AmountRow({
    required this.label,
    required this.amount,
    this.emphasize = false,
  });

  final String label;
  final String amount;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    final style = emphasize
        ? Theme.of(context).textTheme.titleMedium
        : Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: <Widget>[
          Expanded(child: Text(label, style: style)),
          Text(amount, style: style),
        ],
      ),
    );
  }
}

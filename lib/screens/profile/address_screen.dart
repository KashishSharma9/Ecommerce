import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';
import '../../providers/address_provider.dart';
import '../../widgets/appbar/appbar.dart';
import 'add_address_screen.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    final addresses = addressProvider.addresses;
    final dark = SHelperFunctions.isDarkMode(context) ;

    return Scaffold(
      appBar: SAppBar(
        title: Text('My Addresses'),
        showbackarrow: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddAddressScreen()),
          );
          // ✅ Rebuild after returning
          Provider.of<AddressProvider>(context, listen: false).notifyListeners();
        },
        child: const Icon(Icons.add_location_alt),
      ),

      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Saved Addresses",
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall),
            const SizedBox(height: SSizes.spaceBtwSections),

            // ✅ Address List
            Expanded(
              child: addresses.isEmpty
                  ? const Center(child: Text("No addresses added yet"))
                  : ListView.builder(
                itemCount: addresses.length,
                itemBuilder: (ctx, i) {
                  final addr = addresses[i];
                  return Container(
                    color: dark ? SColors.darkGrey : Colors.white,
                    margin: const EdgeInsets.only(
                        bottom: SSizes.spaceBtwItems),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(SSizes.md),
                      title: Text(addr.name),
                      subtitle: Text(
                          "${addr.addressLine}, ${addr.city}, ${addr
                              .state} - ${addr.pincode}\nPhone: ${addr.phone}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () =>
                            addressProvider.removeAddress(addr.id),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
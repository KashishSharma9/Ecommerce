import 'package:ecommereceapp/screens/profile/add_bank_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../ utils/constants/colors.dart';
import '../../ utils/constants/sizes.dart';
import '../../helpers/helper_function.dart';

import '../../providers/bank_account_provider.dart';
import '../../widgets/appbar/appbar.dart';


class BankDetailsScreen extends StatelessWidget {
  const BankDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bankProvider = Provider.of<BankProvider>(context);
    final banks = bankProvider.banks;
    final dark = SHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: SAppBar(
        title: const Text('My Bank Details'),
        showbackarrow: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddBankAccount()),
          );
        },
        child: const Icon(Icons.add_card),
      ),
      body: Padding(
        padding: const EdgeInsets.all(SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saved Bank Accounts",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: SSizes.spaceBtwSections),
            Expanded(
              child: banks.isEmpty
                  ? const Center(child: Text("No bank details added yet"))
                  : ListView.builder(
                itemCount: banks.length,
                itemBuilder: (ctx, i) {
                  final bank = banks[i];
                  return Container(
                    color: dark ? SColors.darkGrey : Colors.white,
                    margin: const EdgeInsets.only(
                        bottom: SSizes.spaceBtwItems),
                    child: ListTile(
                      contentPadding:
                      const EdgeInsets.all(SSizes.md),
                      title: Text(bank.accountHolderName),
                      subtitle: Text(
                          "${bank.bankName} - ${bank.branchName}\nA/C No: ${bank.accountNumber}\nIFSC: ${bank.ifscCode}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () =>
                            bankProvider.removeBank(bank.id),
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

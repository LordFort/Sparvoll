import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shops/controllers/all_products_controller.dart';
import '../../../../features/shops/models/product_model.dart';
import '../../../../features/utils/constants/sizes.dart';
import '../../../../features/utils/device/device_utility.dart';
import '../../layouts/grid_layout.dart';
import '../carts/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) => controller.sortProducts(value!),
          value: controller.selectedSortOption.value,
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
              .map((option) => DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(
              () => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => TProductCardVertical(product: controller.products[index], isNetworkImage: true),
          ),
        ),
        SizedBox(height: TDeviceUtils.getBottomNavigationBarHeight() + TSizes.defaultSpace),
      ],
    );
  }
}

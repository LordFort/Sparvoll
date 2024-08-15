import 'package:flutter/material.dart';

import '../../../../../features/shops/controllers/product/product_controller.dart';
import '../../../../../features/shops/models/product_model.dart';
import '../../../../../features/utils/constants/enums.dart';
import '../../../../../features/utils/constants/sizes.dart';
import '../../product_price_text.dart';


class PricingWidget extends StatelessWidget {
  const PricingWidget({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Actual Price if sale price not null
          if (product.productType == ProductType.single.toString() && product.salePrice > 0)
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Text(
                product.price.toString(),
                style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
              ),
            ),

          /// Price, Show sale price as main price if sale exist.
          Padding(
            padding: const EdgeInsets.only(left: TSizes.sm),
            child: TProductPriceText(price: ProductController.instance.getProductPrice(product)),
          ),
        ],
      ),
    );
  }
}

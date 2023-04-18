import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.onTap,
    required this.heroTag,
    this.isFavorite = true,
  });

  final String imageUrl;
  final String name;
  final VoidCallback onTap;
  final String heroTag;
  final isFavorite;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: onTap,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(
            name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SvgPaletteCard(
  //     cacheKey: name,
  //     url: imageUrl,
  //     onTap: onTap,
  //     height: 160,
  //     margin: EdgeInsets.symmetric(vertical: 8),
  //     builder: (context, picture) {
  //       return Padding(
  //         padding: const EdgeInsets.all(16),
  //         child: Row(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 name,
  //                 style: Theme.of(context)
  //                     .textTheme
  //                     .titleMedium!
  //                     .copyWith(fontWeight: FontWeight.w300),
  //               ),
  //             ),
  //             ConstrainedBox(
  //               constraints: BoxConstraints(
  //                 maxWidth: MediaQuery.of(context).size.width / 2,
  //               ),
  //               child: picture == null
  //                   ? const SizedBox.shrink()
  //                   : Hero(tag: heroTag, child: picture),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //     backgroundColorBuilder: (context, palette) {
  //       final color = Theme.of(context).brightness == Brightness.light
  //           ? palette.lightVibrantColor?.color
  //           : palette.darkVibrantColor?.color;

  //       return color?.withAlpha(120);
  //     },
  //   );
  // }
}

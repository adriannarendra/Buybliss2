import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buybliss2/model/product_data.dart';
import 'package:buybliss2/screens/details/detail_screen.dart';
import 'package:buybliss2/sized_config.dart';
import 'package:buybliss2/state_managements/search_provide.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: Container(
        width: SizedConfig.screenWidth * 0.6,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) {
            Provider.of<SearchProvider>(context, listen: false)
                .updateSearchQuery(value, demoProducts);
            _updateOverlay(context); // Update overlay
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: getPropScreenWidth(20),
              vertical: getPropScreenHeight(9),
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            prefixIcon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }

  void _updateOverlay(BuildContext context) {
    _removeOverlay();
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);

    if (searchProvider.searchQuery.isNotEmpty &&
        searchProvider.filteredProducts.isNotEmpty) {
      _overlayEntry = _myOverlayEntry(context);
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  OverlayEntry _myOverlayEntry(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context, listen: false);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: SizedConfig.screenWidth * 0.6,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(-10, 20), // Adjust as needed
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(10),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              shrinkWrap: true,
              itemCount: searchProvider.filteredProducts.length,
              itemBuilder: (context, index) {
                final product = searchProvider.filteredProducts[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade600),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        DetailScreen.routesName,
                        arguments: product,
                      );
                      searchProvider.clearSearch(); // Clear search on selection
                      _removeOverlay(); // Remove overlay
                    },
                    leading: Image.asset(
                      product.images[0],
                      width: 30,
                    ),
                    title: Text(product.title),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _removeOverlay();
    super.dispose();
  }
}
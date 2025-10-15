import 'package:flutter/material.dart';

class CustomExpansionTile extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool? isExpanded;
  final int? itemCount;
  final VoidCallback? onTitleTap;
  final TextStyle? titleStyle;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.isExpanded,
    this.itemCount,
    this.onTitleTap,
    this.titleStyle,
  });

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _heightAnimation;
  bool _isExpanded = false; // Track the expanded state separately

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded ?? false;
    _controller = AnimationController(
      value: widget.isExpanded == true ? 1.0 : 0,
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _heightAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            if (widget.onTitleTap != null) {
              widget.onTitleTap!();
            }
            setState(() {
              _isExpanded = !_isExpanded; // Update the expanded state
              if (_isExpanded) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            });
          },
          child: SizedBox(
            height: 46,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${widget.title} ${widget.itemCount ?? ''}',
                    style: widget.titleStyle ??TextStyle(fontSize: 20,
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                  Icon(
                    _isExpanded ? Icons.expand_less : Icons.expand_more,
                    color:Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _heightAnimation,
          child: Column(
            children: List.generate(
              widget.children.length,
              (index) {
                return widget.children[index];
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/view_models/base_view_model.dart';

class BaseView extends StatefulWidget {
  final BaseViewModel viewModel;
  final Widget child;

  const BaseView({
    Key key,
    @required this.viewModel,
    @required this.child,
  }) : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:seafood_app/bloc/order/order_cubit.dart';
import 'package:seafood_app/constants.dart';
import 'package:seafood_app/domans/repo/impl/order_repo_impl.dart';
import 'package:seafood_app/domans/repo/order_repo.dart';
import 'package:seafood_app/model/order_model.dart';
import 'package:seafood_app/screens/widgets/order_card.dart';

import '../../../bloc/order/order_state.dart';
import '../../../domans/data_source/seafood_api.dart';
import '../../../ultils/enums/enum_data.dart';

class OrderScreens extends StatelessWidget {
  const OrderScreens({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => OrderCubit(OrderRepoImpl(seafoodApi: SeafoodApi())),
  child: Container(decoration:
    BoxDecoration(color: Colors.grey[100])
        , child: const OrderPage()),
);
  }
}
final statuses = [
  {"text": "Đang xử lý", "status": 1},
  {"text": "Đang giao", "status": 2},
  {"text": "Hoàn thành", "status": 3},
  {"text": "Đã hủy", "status": 4},
];
class OrderPage extends StatelessWidget {
  const OrderPage({super.key});



  @override
  Widget build(BuildContext context) {
    return buildOrderPage(context);
  }
  Widget buildOrderPage(BuildContext context) {
    return DefaultTabController(
      length: statuses.length,
      child: Column(
        children: [
          buildSearchToolbar(context),
          TabBar(
            tabs: statuses.map((e) => Tab(text: e['text'].toString())).toList(),
            labelColor: kOrangeColor,
            unselectedLabelColor: Colors.black,
            indicatorColor: kOrangeColor,
          ),
          Expanded(
            child: TabBarView(
              children: [
                buildOrderList_1(context),
                buildOrderList_2(context),
                buildOrderList_3(context),
                buildOrderList_4(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget buildOrderList_1(BuildContext context) {
    int status = 1;
    int customerId = 1;

    context.read<OrderCubit>().fetchStatus1(customerId);

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.dataStatus == DataStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.dataStatus == DataStatus.success) {

          if (state.dataStatus_1 == null) {
            return const Center(child: Text('Bạn chưa có đơn hàng nào cả.'));
          }

          final orders = state.dataStatus_1?.data as List<OrderModel>;


          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return OrderCard(order: order);
            },
          );
        } else if (state.dataStatus == DataStatus.error) {
          return Center(child: Text('Error: ${state.dataStatus_1?.message}'));
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
  Widget buildOrderList_2(BuildContext context) {
    int status = 2;
    int customerId = 1;

    context.read<OrderCubit>().fetchStatus2(customerId);

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.dataStatus == DataStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.dataStatus == DataStatus.success) {
          final orders = state.dataStatus_2?.data as List<OrderModel>;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return OrderCard(order: order);
            },
          );
        } else if (state.dataStatus == DataStatus.error) {
          return Center(child: Text('Error: ${state.dataStatus_2?.message}'));
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
  Widget buildOrderList_3(BuildContext context) {
    int status = 3;
    int customerId = 1;

    context.read<OrderCubit>().fetchStatus3(customerId);

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.dataStatus == DataStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.dataStatus == DataStatus.success) {
          final orders = state.dataStatus_3?.data as List<OrderModel>;

          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return OrderCard(order: order);
            },
          );
        } else if (state.dataStatus == DataStatus.error) {
          return Center(child: Text('Error: ${state.dataStatus_3?.message}'));
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
  Widget buildOrderList_4(BuildContext context) {
    int status = 4;
    int customerId = 1;

    context.read<OrderCubit>().fetchStatus4(customerId);

    return BlocBuilder<OrderCubit, OrderState>(
      builder: (context, state) {
        if (state.dataStatus == DataStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.dataStatus == DataStatus.success) {
          final orders = state.dataStatus_4?.data as List<OrderModel>;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return OrderCard(order: order);
            },
          );
        } else if (state.dataStatus == DataStatus.error) {
          return Center(child: Text('Error: ${state.dataStatus_4?.message}'));
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }

}

// Hàm để tạo toolbar tìm kiếm
Widget buildSearchToolbar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogo(), // Gọi hàm để tạo logo
        _buildSearchField(), // Gọi hàm để tạo ô tìm kiếm
        _buildCartIcon(context), // Gọi hàm để tạo biểu tượng giỏ hàng
      ],
    ),
  );
}

// Hàm để xây dựng logo
Widget _buildLogo() {
  return Expanded(
    flex: 2, // Tương ứng với android:layout_weight="0.2"
    child: Image.asset(
      'assets/images/logo.png', // Đường dẫn tới ảnh logo
      height: 50,
    ),
  );
}

// Hàm để xây dựng ô tìm kiếm
Widget _buildSearchField() {
  return Expanded(
    flex: 6, // Tương ứng với android:layout_weight="0.6"
    child: Container(
      margin: const EdgeInsets.only(left: 5, top: 4, bottom: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Nhập vào mã đơn hàng?",
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              // Logic để xóa nội dung tìm kiếm
            },
          ),
        ),
      ),
    ),
  );
}

// Hàm để xây dựng biểu tượng giỏ hàng
Widget _buildCartIcon(BuildContext context) {
  return Expanded(
    flex: 1, // Tương ứng với android:layout_weight="0.1"
    child: GestureDetector(
      onTap: () {
        context.push('/cart');
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        alignment: Alignment.center,
        child: Image.asset(
          'assets/images/cargo.png', // Đường dẫn tới ảnh giỏ hàng
          height: 25,
        ),
      ),
    ),
  );
}

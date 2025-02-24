import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          _buildHeader(context),
          _buildSteps(context),
          SizedBox(
            height: 1.sh, // Full screen height
            child: Row(
              children: [
                Expanded(flex: 3, child: _buildMenuGrid()),
                Expanded(flex: 1, child: _buildCartSection(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.w),
      color: Color(0xFF4b4bf7),
      child: Center(
        child: Container(
          width: 1.sw,
          height: 250.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            image: DecorationImage(
              image: AssetImage('images/navmenu.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSteps(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Container(
          width: double.infinity,
          color: Color(0xFFf5afeb),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
          child: Container(
            padding: EdgeInsets.all(5.h),
            decoration: BoxDecoration(
              color: Color(0xFF4b4bf7),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('70 ORDERS',
                    style: TextStyle(color: Colors.white, fontSize: 5.sp)),
                Icon(Icons.star, color: Colors.white, size: 8.sp),
                Text('YOU\'RE AMAZING',
                    style: TextStyle(color: Colors.white, fontSize: 5.sp)),
                Icon(Icons.star, color: Colors.white, size: 8.sp),
                Text('SPECIAL PRIZE FOR YOU',
                    style: TextStyle(color: Colors.white, fontSize: 5.sp)),
                Icon(Icons.star, color: Colors.white, size: 8.sp),
                Icon(Icons.star, color: Colors.white, size: 8.sp),
              ],
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 10.w,
                height: 10.w,
                margin: EdgeInsets.only(left: 20.w),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child:
                    Icon(Icons.arrow_back_ios, size: 5.sp, color: Colors.white),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'WELCOME TO THE FUTURE',
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _stepIndicator('1', 'CHOOSE', isActive: true),
            _stepIndicator('2', 'PAYMENT'),
            _stepIndicator('3', 'CONFIRM'),
          ],
        ),
        SizedBox(height: 100.h),
      ],
    );
  }

  Widget _stepIndicator(String step, String title, {bool isActive = false}) {
    return Row(
      children: [
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey[300],
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            step,
            style: TextStyle(
              fontSize: 5.sp,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.white : Colors.black54,
            ),
          ),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 5.sp,
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.black : Colors.grey,
              ),
            ),
            SizedBox(height: 4.h),
            Container(
              width: 60.w,
              height: 3.h,
              color: isActive ? Colors.black : Colors.grey[300],
            ),
          ],
        ),
        SizedBox(width: 20.w),
      ],
    );
  }

  // ✅ CATEGORY SELECTION
  Widget _buildCategories() {
    return SizedBox(
      height: 150.h,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _categoryItem('images/cat1.png'),
            _categoryItem('images/cat1.png', isSelected: true),
            _categoryItem('images/cat1.png'),
            _categoryItem('images/cat1.png'),
            _categoryItem('images/cat1.png'),
          ],
        ),
      ),
    );
  }

  Widget _categoryItem(String imagePath, {bool isSelected = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Container(
        width: 70.w,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected ? Color(0xFF4b4bf7) : Colors.transparent,
            width: 1.w,
          ),
        ),
        child: Center(
          child: Image.asset(
            imagePath,
            width: 70.w,
            height: 70.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildMenuGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        children: [
          // ✅Categories Selection
          _buildCategories(),
          SizedBox(height: 30.0),
          SizedBox(height: 30.h),
          Text(
            'CLASSIC ICED',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
              shadows: [
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 2.0,
                  color: Color(0xFF4b4bf7),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                childAspectRatio: 0.75,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                return _menuItem();
              },
            ),
          ),
        ],
      ),
    );
  }

  // ✅ CART SECTION
  Widget _buildCartSection(context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 2.w),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                    color: Color(0xFF4b4bf7),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.r),
                      topRight: Radius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart,
                          color: Colors.white, size: 8.sp),
                      SizedBox(width: 8.w), // مسافة بين الأيقونة والنص
                      Text('CART',
                          style:
                              TextStyle(fontSize: 8.sp, color: Colors.white)),
                    ],
                  ),
                ),
                Spacer(),
                Text('You have no orders yet',
                    style: TextStyle(fontSize: 8.sp)),
                Spacer(),
                _cartButton('Checkout', isDisabled: true),
                _cartButton('Clear', isDisabled: true),
              ],
            ),
          ),
        ),
        // ✅ Bottom Help Button
        _buildNeedHelpButton(context),
      ],
    );
  }

  Widget _cartButton(String title, {bool isDisabled = false}) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(3.w),
      child: ElevatedButton(
        onPressed: isDisabled ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled ? Color(0xFFb9b9b9) : Colors.white,
          minimumSize: Size(150.w, 30.h),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
        child:
            Text(title, style: TextStyle(fontSize: 8.sp, color: Colors.black)),
      ),
    );
  }

  // ✅ NEED HELP BUTTON
  Widget _buildNeedHelpButton(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        margin: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: Color(0xFFb9b9b9),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: InkWell(
          onTap: () {},
          child: Text('⚪ Need Help',
              style: TextStyle(fontSize: 8.sp, color: Colors.white)),
        ),
      ),
    );
  }

  Widget _menuItem() {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Colors.grey),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'images/cat1.png',
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 20.h),
          Text('Freddo Americano',
              style: TextStyle(fontSize: 5.sp, fontWeight: FontWeight.bold)),
          Spacer(),
          Container(
              padding: EdgeInsets.all(2.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text('KD 1.720',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 5.sp, color: Colors.white))),
        ],
      ),
    );
  }
}

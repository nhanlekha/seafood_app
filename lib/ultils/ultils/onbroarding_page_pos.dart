enum OnBoardingPos{
  page1,
  page2,
  page3
}


extension OnBoardingPagePosExtension on OnBoardingPos{
  String onBoardingPageImage() {
    switch (this) {
      case OnBoardingPos.page1:
      // TODO: Handle this case.
        return "assets/images/onboarding1.png";
      case OnBoardingPos.page2:
      // TODO: Handle this case.
        return "assets/images/onboarding2.png";
      case OnBoardingPos.page3:
      // TODO: Handle this case.
        return "assets/images/onboarding3.png";
    }
  }

  String onBoardingPageTitle() {
    switch (this) {
      case OnBoardingPos.page1:
        return "Khám Phá Hải Sản"; // Tiêu đề trang 1
      case OnBoardingPos.page2:
        return "Giao Hàng Nhanh Chóng"; // Tiêu đề trang 2
      case OnBoardingPos.page3:
        return "Đặt Hàng Dễ Dàng"; // Tiêu đề trang 3
      default:
        return ""; // Mặc định nếu không khớp
    }
  }

  String onBoardingPageContent() {
    switch (this) {
      case OnBoardingPos.page1:
        return "Khám phá đa dạng các loại hải sản tươi sống được tuyển chọn kỹ càng từ các nguồn cung cấp uy tín."; // Nội dung trang 1
      case OnBoardingPos.page2:
        return "Giao hải sản nhanh chóng đến tận nhà, đảm bảo độ tươi ngon của sản phẩm."; // Nội dung trang 2
      case OnBoardingPos.page3:
        return "Chỉ với vài thao tác đơn giản, bạn đã có thể đặt hàng và nhận hải sản tươi ngon ngay tại nhà."; // Nội dung trang 3
      default:
        return ""; // Mặc định nếu không khớp
    }

  }


}
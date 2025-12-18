import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: myBody());
  }

  Widget myBody() {
    return ListView(children: [block1(), block2(), block3()]);
  }

  Widget block1() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 0),
      child: Container(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.orange, width: 3),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, size: 18, color: Colors.black87),
                    const SizedBox(width: 6),
                    
                    Flexible(
                      child: Text(
                        "Xung quanh vị trí hiện tại",
                        style: TextStyle(fontSize: 14, color: Colors.black87),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "23 thg 10 – 24 thg 10",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget block2() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300, width: 1),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 0, offset: Offset(0, 2)),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 20),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Row(children: [Icon(Icons.swap_vert)]),
              SizedBox(width: 4),
              Text("Sắp xếp"),
            ],
          ),
          Row(
            children: [
              Row(children: [Icon(Icons.filter_list)]),
              SizedBox(width: 4),
              Text("Lọc"),
            ],
          ),
          Row(
            children: [
              Row(children: [Icon(Icons.map_outlined)]),
              SizedBox(width: 4),
              Text("Bản đồ"),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 10),
          child: Text(
            "757 chỗ nghỉ",
            style: TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ),
        //anhill Boutique
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          ),

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 120,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/anhill-boutique.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Container(
                      width: 120,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Bao bữa sáng",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "aNhill Boutique",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 24,
                          ),
                        ],
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) =>
                              Icon(Icons.star, color: Colors.orange, size: 20),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF1DA1F2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "9.5",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("Xuất sắc"),
                          SizedBox(width: 8),
                          Text(
                            "95 đánh giá",
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(221, 184, 178, 178),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text("Huế"),
                          SizedBox(width: 8),
                          Text("Cách bạn 0.6km"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "1 suite riêng tư: ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text("1 giường", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "USD\$109",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "Đã bao gồm thuế và phí",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //An nam Hue Boutique
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 120,
                      height: 160,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/an-nam-boutique.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Container(
                      width: 120,
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Bao bữa sáng",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "An Nam Hue Boutique",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 24,
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF1DA1F2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "9.2",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("Tuyệt hảo"),
                          SizedBox(width: 8),
                          Text(
                            "34 đánh giá",
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(221, 184, 178, 178),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text("Cư Chinh"),
                          SizedBox(width: 8),
                          Text("Cách bạn 0.9km"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "1 phòng 1 khách sạn: ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text("1 giường", style: TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "USD\$20",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "Đã bao gồm thuế và phí",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        //Huế Jade Hill Villa - FIX LỖI Ở ĐÂY
        Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 120,
                      height: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/hue-jade-hill.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Huế Jade Hill Villa",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                            size: 24,
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Được quản lý bởi một host cá nhân",
                        style: TextStyle(
                          fontSize: 12,
                          color: const Color.fromARGB(137, 5, 2, 2),
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Color(0xFF1DA1F2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "8.0",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text("Rất tốt"),
                          SizedBox(width: 8),
                          Text(
                            "01 đánh giá",
                            style: TextStyle(
                              fontSize: 14,
                              color: const Color.fromARGB(221, 184, 178, 178),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 16,
                          ),
                          SizedBox(width: 4),
                          Text("Cư Chinh"),
                          SizedBox(width: 8),
                          Text("Cách bạn 1.3km"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "1 biệt thự nguyên căn - 1.000 m2: ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "4 giường - 3 phòng ngủ - 1 phòng khách • 3 phòng tắm",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "USD\$285",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Text(
                            "Đã bao gồm thuế và phí",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              "Chỉ còn 1 căn với giá này trên Booking.com",
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(221, 206, 24, 24),
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Spacer(),
                          Icon(Icons.check),
                          Text(
                            "Không cần thanh toán trước",
                            style: TextStyle(
                              fontSize: 12,
                              color: const Color.fromARGB(221, 3, 3, 3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
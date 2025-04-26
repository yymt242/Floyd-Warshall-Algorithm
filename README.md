# Chương 2: Ví dụ minh họa

```
Không có đường đi: C -> G
[0 inf 14 inf inf inf inf 18; inf 0 inf inf inf 2 inf 17; 12 15 0 15 inf 3 inf inf; 6 inf inf 0 3 3 inf inf; inf inf inf inf 0 inf inf 9; inf inf inf inf inf 0 inf inf; inf 13 inf inf 7 3 0 inf; inf inf 20 inf inf inf inf 0]
{"A", "B", "C", "D", "E", "F", "G", "H"}


Có đường đi duy nhất: ĐH Bách Khoa -> Nhà Văn Hóa
[     0    Inf  Inf  11   7   Inf  Inf;    17    0    Inf  Inf  Inf Inf  7;    Inf  Inf  0    Inf  Inf 20   12;    Inf  Inf  2    0    18  3    Inf;     9    4    Inf  6    0   Inf  5;    Inf  Inf  2    4    9   0    Inf;    13   Inf  20   14   1   Inf  0 ]
{"Trạm xe bus", "ĐH Bách Khoa", "ĐH Nhân Văn", "KTX A", "Vòng Xoay", "Nhà Văn Hóa", "Hồ Đá"}

Nhiều kết quả A -> E 
    Khác nhau: 2-1-1, 1-3, 3-1
    [0 2 inf 1 inf 3; inf 0 inf inf 1 inf; inf inf 0 inf inf inf; inf inf 3 0 inf inf; inf inf 1 inf 0 inf; inf inf 1 inf inf 0]
    {"A", "C", "E", "D", "F", "B"}

    Hai đường đi giống nhau: 2-1-1, 1-3, 1-3
    [0 2 inf 1 inf 1; inf 0 inf inf 1 inf; inf inf 0 inf inf inf; inf inf 3 0 inf inf; inf inf 1 inf 0 inf; inf inf 3 inf inf 0]
    {"A", "C", "E", "D", "F", "B"}

    Ba đường đi giống nhau: 1 -3 , 1-3, 1-3
    [0 inf 1 1 1; inf 0 inf inf inf; inf 3 0 inf inf; inf 3 inf 0 inf; inf 3 inf inf 0]
    {"A", "E", "D", "F", "B"}

Chu trình âm
    [0 4 inf; inf 0 -3; 2 -2 0]
    {"A", "B", "C"}

    [0 2 -2; 2 0 -2; -2 -2 0]
    {"Đỉnh 1", "Đỉnh 2", "Đỉnh 3"}

    [0 2 -2; 2 0 -2; 0 -2 0]
    {"Đỉnh 1", "Đỉnh 2", "Đỉnh 3"}

    [0, -3,  inf, inf, inf, inf, 7, inf, inf; inf,  0, inf, inf, inf, inf, inf, -2,  inf; inf, inf,  0, 9, inf, -6,  inf, inf, inf; inf, inf, inf,  0, 8, inf, inf, inf, -4; inf, inf, inf, inf,  0, 3, inf, inf, inf; inf, inf, -1,  inf, inf,  0, 2, inf, inf; inf,  6, inf, inf, inf, inf,  0, 5, inf; inf, inf, inf, inf, inf, inf, inf,  0, -7; inf, inf, inf, inf, inf,  4, inf, inf,  0]
    {"A","B","C","D","E","F","G","H","I"}
```

# Chương 3: Dữ liệu đầu vào 

## Bài toán 1

```latex
{"Tân Sơn Nhất", "Nội Bài", "Phù Cát", "Đà Nẵng", "Vinh", "Buôn Ma Thuột", "Cam Ranh", "Phú Quốc", "Liên Khương", "Đồng Hới", "Thọ Xuân", "Cần Thơ", "Cát Bi", "Pleiku", "Phú Bài", "Điện Biên", "Chu Lai", "Tuy Hòa", "Rạch Giá", "Cà Mau", "Côn Đảo", "Vân Đồn"}
```

```
[
0.0 1159.9 434.5 606.1 886.3 259.5 308.0 300.4 75.6 744.7 1018.4 Inf 1112.3 383.6 630.7 1240.0 557.1 383.0 192.4 244.5 231.8 1148.7;
1159.9 0.0 877.6 626.8 276.7 982.0 1087.4 1243.7 1116.9 419.8 149.9 1238.0 Inf 834.7 571.8 290.0 714.0 982.7 1253.3 1340.2 1390.8 Inf;
434.5 877.6 0.0 Inf Inf Inf Inf Inf Inf Inf Inf Inf 802.2 Inf Inf Inf Inf Inf Inf Inf Inf Inf;
606.1 626.8 Inf 0.0 400.6 377.3 464.5 797.9 544.8 Inf 516.1 717.2 552.0 228.9 Inf Inf Inf Inf Inf Inf Inf 569.1;
886.3 276.7 Inf Inf 0.0 723.3 Inf Inf Inf Inf Inf 961.5 Inf 581.1 Inf Inf Inf Inf Inf Inf Inf Inf;
259.5 982.0 Inf 377.3 723.3 0.0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 312.3 Inf Inf Inf Inf Inf;
308.0 1087.4 Inf 464.5 Inf Inf 0.0 Inf Inf Inf Inf Inf 1016.2 Inf Inf Inf Inf Inf Inf Inf Inf Inf;
300.4 1243.7 Inf 797.9 969.2 Inf Inf 0.0 369.4 Inf 1094.3 Inf 1220.2 Inf 800.7 Inf Inf Inf Inf Inf Inf Inf;
75.6 1116.9 Inf 544.8 846.5 Inf Inf 369.4 0.0 Inf 978.6 207.9 1064.3 Inf 574.2 Inf Inf Inf Inf Inf Inf Inf;
744.7 419.8 Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf;
1018.4 Inf Inf Inf Inf 852.8 965.8 Inf 978.6 Inf 0.0 1092.3 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf;
Inf 1238.0 Inf 717.2 Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf Inf Inf Inf Inf Inf Inf 180.6 Inf;
1112.3 Inf Inf 552.0 Inf Inf 1016.2 1220.2 1064.3 Inf Inf Inf 0.0 Inf Inf Inf Inf Inf Inf Inf Inf Inf;
383.6 834.7 Inf 228.9 581.1 Inf Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf Inf Inf Inf Inf Inf Inf;
630.7 571.8 Inf Inf Inf Inf 515.7 800.7 574.2 Inf Inf Inf Inf Inf 0.0 Inf Inf Inf Inf Inf Inf Inf;
1240.0 290.0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf Inf Inf Inf Inf;
557.1 714.0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf Inf Inf Inf;
383.0 982.7 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf Inf Inf;
192.4 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf Inf;
244.5 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 0.0 Inf Inf;
231.8 1390.8 Inf Inf Inf Inf Inf Inf Inf Inf Inf 180.6 Inf Inf Inf Inf Inf Inf Inf Inf 0.0 Inf;
1148.7 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 0.0;
]
```

## Bài toán 2

```
{"TP. Thủ Đức", "Q. Bình Tân", "Q. Bình Thạnh", "H. Bình Chánh", "Q. Tân Bình", "Q. Tân Phú", "Q. Phú Nhuận", "Q. Gò Vấp", "H. Hóc Môn", "H. Cần Giờ", "H. Củ Chi", "H. Nhà Bè", "Q1", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q10", "Q11", "Q12"}
```

```
[
0 Inf 13.2 Inf Inf Inf Inf Inf Inf Inf Inf Inf 13.7 Inf 14.4 Inf Inf 16 Inf Inf Inf 20.7;
Inf 0 Inf 9.3 Inf 9.3 Inf Inf 19.9 Inf Inf Inf Inf Inf Inf Inf 8.9 Inf 12.7 Inf Inf 19.3;
10.5 Inf 0 Inf Inf Inf 5.8 6.7 Inf Inf Inf Inf 5.5 Inf Inf Inf Inf Inf Inf Inf Inf 12;
Inf 8.9 Inf 0 Inf Inf Inf Inf 25.4 Inf Inf 35.4 Inf Inf Inf Inf Inf 23.5 15.2 Inf Inf Inf;
Inf Inf Inf Inf 0 5.2 2.4 7.4 Inf Inf Inf Inf Inf 4.4 Inf Inf Inf Inf Inf 4.8 6.1 11;
Inf 8.2 Inf Inf 5.5 0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 5 Inf Inf Inf 3.9 14.9;
Inf Inf 4.9 Inf 2.6 Inf 0 5.6 Inf Inf Inf Inf 4.2 2.6 Inf Inf Inf Inf Inf Inf Inf Inf;
Inf Inf 7.4 Inf 6.8 Inf 5.3 0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 6;
Inf 16.2 Inf 24.3 Inf Inf Inf Inf 0 Inf 12.5 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 6.8;
Inf Inf Inf Inf Inf Inf Inf Inf Inf 0 Inf 17.4 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf;
Inf Inf Inf Inf Inf Inf Inf Inf 12.5 Inf 0 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf;
Inf Inf Inf 24.1 Inf Inf Inf Inf Inf 31.6 Inf 0 Inf Inf Inf Inf Inf 24.8 Inf Inf Inf Inf;
12.7 Inf 7 Inf Inf Inf 5.2 Inf Inf Inf Inf Inf 0 3.5 2.6 4.8 Inf Inf Inf 5 Inf Inf;
Inf Inf Inf Inf 3.8 Inf 2.6 Inf Inf Inf Inf Inf 2.6 0 Inf 4.6 Inf Inf Inf 3.4 Inf Inf;
14.1 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 3.1 Inf 0 5.5 Inf 6 8.5 Inf Inf Inf;
Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 4.7 4.4 5.1 0 4.7 Inf 4.1 2.6 3.1 Inf;
Inf 7.3 Inf Inf Inf 6.6 Inf Inf Inf Inf Inf Inf Inf Inf Inf 6.5 0 Inf 8 Inf 5.2 Inf;
14.8 Inf Inf 21.5 Inf Inf Inf Inf Inf Inf Inf 15 Inf Inf 6.1 Inf Inf 0 11.1 Inf Inf Inf;
Inf 16.1 Inf 13.7 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 8.1 3.8 6.2 11.2 0 Inf Inf Inf;
Inf Inf Inf Inf 6.2 Inf Inf Inf Inf Inf Inf Inf 5.4 3.7 Inf 2.8 Inf Inf Inf 0 3.3 Inf;
Inf Inf Inf Inf 6 3.9 Inf Inf Inf Inf Inf Inf Inf Inf Inf 3.2 3.6 Inf Inf 3.4 0 Inf;
20.6 15.8 15.6 Inf 13.2 14.3 Inf 5.9 6.3 Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf Inf 0;
]
```


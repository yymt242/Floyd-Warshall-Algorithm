function D = generate_distance_matrix(coordList)
n = numel(coordList);
D = zeros(n);

lat = zeros(n,1);
lon = zeros(n,1);
for i = 1:n
    parts = split(coordList{i}, ',');
    lat(i) = str2double(parts{1});
    lon(i) = str2double(parts{2});
end

for i = 1:n
    for j = 1:n
        if i == j
            D(i,j) = 0;
        else
            D(i,j) = haversine_km(lat(i), lon(i), lat(j), lon(j));
        end
    end
end
end

function d = haversine_km(lat1, lon1, lat2, lon2)
R = 6371; % Đường kính trái đất (km)
dlat = deg2rad(lat2 - lat1);
dlon = deg2rad(lon2 - lon1);
a = sin(dlat/2)^2 + cos(deg2rad(lat1)) * cos(deg2rad(lat2)) * sin(dlon/2)^2;
c = 2 * atan2(sqrt(a), sqrt(1 - a));
d = R * c;
end

function write_matrix_to_file(D, D2, filename)
fid = fopen(filename, 'w');
if fid == -1
    error('Cannot open file: %s', filename);
end
fprintf(fid, '[\n');
[rows, cols] = size(D);
for i = 1:rows
    for j = 1:cols
        fprintf(fid, '%.1f ', D(i,j));
    end
    fprintf(fid, ';\n');
end
fprintf(fid, ']\n');
fprintf(fid, D2);
fclose(fid);
end

coords = {
    '10.8154171,106.661503';
    '21.2133981,105.7959466';
    '13.953685,109.0458761';
    '16.0569855,108.1999623';
    '18.7275635,105.6661334';
    '12.6645898,108.1150159';
    '11.9980834,109.2164235';
    '10.1628279,103.9954383';
    '11.2574759,107.1873677';
    '17.512268,106.5870092';
    '19.9011867,105.4652684';
    '10.0804884,105.7096027';
    '20.8186237,106.720442';
    '14.0067674,108.0035146';
    '16.3972086,107.700987';
    '21.4010829,103.0037859';
    '15.4146359,108.7016491';
    '13.0498782,109.3414293';
    '9.9601982,105.1319119';
    '9.1759682,105.1731226';
    '8.7312604,106.6260937';
    '21.1203111,107.4135029'
    };

khoangcach = generate_distance_matrix(coords);
matranke = [
    0	1	1	1	1	1	1	1	1	1	1	inf	1	1	1	1	1	1	1	1	1	1;
    1	0	1	1	1	1	1	1	1	1	1	1	inf	1	1	1	1	1	1	1	1	inf;
    1	1	0	inf	inf	inf	inf	inf	inf	inf	inf	inf	1	inf	inf	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	0	1	1	1	1	1	inf	1	1	1	1	inf	inf	inf	inf	inf	inf	inf	1;
    1	1	inf	inf	0	1	inf	inf	inf	inf	inf	1	inf	1	inf	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	1	1	0	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	1	inf	inf	inf	inf	inf;
    1	1	inf	1	inf	inf	0	inf	inf	inf	inf	inf	1	inf	inf	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	1	1	inf	inf	0	1	inf	1	inf	1	inf	1	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	1	1	inf	inf	1	0	inf	1	1	1	inf	1	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	inf	inf	inf	inf	inf	inf	0	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf;
    1	inf	inf	inf	inf	1	1	inf	1	inf	0	1	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf;
    inf	1	inf	1	inf	inf	inf	inf	inf	inf	inf	0	inf	inf	inf	inf	inf	inf	inf	inf	1	inf;
    1	inf	inf	1	inf	inf	1	1	1	inf	inf	inf	0	inf	inf	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	1	1	inf	inf	inf	inf	inf	inf	inf	inf	0	inf	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	inf	inf	inf	1	1	1	inf	inf	inf	inf	inf	0	inf	inf	inf	inf	inf	inf	inf;
    1	1	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	0	inf	inf	inf	inf	inf	inf;
    1	1	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	0	inf	inf	inf	inf	inf;
    1	1	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	0	inf	inf	inf	inf;
    1	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	0	inf	inf	inf;
    1	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	0	inf	inf;
    1	1	inf	inf	inf	inf	inf	inf	inf	inf	inf	1	inf	inf	inf	inf	inf	inf	inf	inf	0	inf;
    1	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	inf	0
    ];

format shortG
khoangcach = khoangcach .* matranke;
tensanbay = '{"Tân Sơn Nhất", "Nội Bài", "Phù Cát", "Đà Nẵng", "Vinh", "Buôn Ma Thuột", "Cam Ranh", "Phú Quốc", "Liên Khương", "Đồng Hới", "Thọ Xuân", "Cần Thơ", "Cát Bi", "Pleiku", "Phú Bài", "Điện Biên", "Chu Lai", "Tuy Hòa", "Rạch Giá", "Cà Mau", "Côn Đảo", "Vân Đồn"}';
write_matrix_to_file(khoangcach, tensanbay, 'EX1_Data.txt');
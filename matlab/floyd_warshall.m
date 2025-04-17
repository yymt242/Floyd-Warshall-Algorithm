% Hàm chính để chạy chương trình, tên hàm trùng với tên file "floyd_warshall.m"
function floyd_warshall()
clc;
clear;
costMatrix = input('Nhập ma trận chi phí dạng ma trận (ví dụ: [0 1 inf; 1 0 2; inf inf 0]):\n');
nodeNames = input('Nhập tên các đỉnh dưới dạng mảng chuỗi (ví dụ: {"Node1", "Node2", "Node3"}):\n');
if length(nodeNames) ~= size(costMatrix, 1)
    error('Số lượng tên đỉnh không khớp với kích thước của ma trận chi phí.');
end
startName = input('Nhập tên đỉnh bắt đầu: ', 's');
endName = input('Nhập tên đỉnh kết thúc: ', 's');
startIndex = getNodeIndex(startName, nodeNames);
endIndex = getNodeIndex(endName, nodeNames);
[shortestPath, totalCost, negativeCycle, finalCostMatrix, nextMatrix] = floyd_algorithm(costMatrix, startIndex, endIndex);
in_ket_qua(shortestPath, totalCost, startIndex, endIndex, nodeNames, negativeCycle, finalCostMatrix, nextMatrix);
ve_do_thi(costMatrix, nodeNames, shortestPath);
end

% Hàm lấy chỉ số của đỉnh khi biết tên đỉnh
function nodeIndex = getNodeIndex(nodeName, nodeNames)
nodeIndex = -1;
for i = 1:length(nodeNames)
    if strcmp(nodeNames{i}, nodeName)
        nodeIndex = i;
        return;
    end
end
if nodeIndex == -1
    error('Đỉnh "%s" không tồn tại trong danh sách các đỉnh.', nodeName);
end
end

% Hàm vẽ đồ thị
function ve_do_thi(costMatrix, nodeNames, shortestPath)
highlightOption = input('Vẽ đồ thị - bạn có muốn tô đỏ đường đi ngắn nhất không? (1: Có, 0: Không): ');
if highlightOption ~= 1 && highlightOption ~= 0
    error('Lựa chọn không hợp lệ. Vui lòng nhập 1 hoặc 0.');
end
if highlightOption == 0
    shortestPath = []; % Không tô đỏ đường đi ngắn nhất
end
s = []; % Danh sách các đỉnh nguồn
t = []; % Danh sách các đỉnh đích
weights = []; % Danh sách trọng số
for i = 1:size(costMatrix, 1)
    for j = 1:size(costMatrix, 2)
        if isfinite(costMatrix(i, j)) && i ~= j
            s(end+1) = i;
            t(end+1) = j;
            weights(end+1) = costMatrix(i, j);
        end
    end
end
G = digraph(s, t, weights); % Tạo đồ thị có hướng từ danh sách các đỉnh và trọng số
G.Nodes.Name = string(nodeNames)';
p = plot(G, ...
    'Layout', 'auto', ...
    'EdgeLabel', G.Edges.Weight, ...
    'NodeLabel', G.Nodes.Name, ...
    'ArrowSize', 15, ...
    'LineWidth', 2, ...
    'MarkerSize', 10, ...
    'NodeFontSize', 14, ...
    'NodeFontWeight', 'bold', ...
    'LineStyle', '-', ...
    'EdgeColor', 'k', ...
    'NodeLabelColor', 'k', ...
    'NodeColor', 'b');
title('Đồ thị');
if ~isempty(shortestPath)
    highlight(p, shortestPath, 'EdgeColor', 'r', 'LineWidth', 6, 'ArrowSize', 20); % Đường đi ngắn nhất
    highlight(p, shortestPath(1), 'NodeColor', 'r', 'MarkerSize', 10); % Đỉnh bắt đầu
    highlight(p, shortestPath(end), 'NodeColor', 'r', 'MarkerSize', 10); % Đỉnh kết thúc
end
end

% Hàm thuật toán Floyd-Warshall
function [shortestPath, totalCost, negativeCycle, finalCostMatrix, nextMatrix] = floyd_algorithm(costMatrix, startIndex, endIndex)
numNodes = size(costMatrix, 1); % Số lượng đỉnh
cost = costMatrix; % Copy ma trận chi phí
% Tạo ma trận truy vết đường đi tiếp theo (next)
next = nan(numNodes);
for i = 1:numNodes
    for j = 1:numNodes
        if costMatrix(i, j) < inf
            next(i, j) = j;
        end
    end
end
% Thuật toán Floyd-Warshall
for k = 1:numNodes % Đỉnh trung gian
    for i = 1:numNodes % Đỉnh bắt đầu
        for j = 1:numNodes % Đỉnh kết thúc
            if cost(i, k) + cost(k, j) < cost(i, j)
                cost(i, j) = cost(i, k) + cost(k, j); % Cập nhật vào ma trận chi phí
                next(i, j) = next(i, k); % Cập nhật vào ma trận truy vết đường đi
            end
        end
    end
end
finalCostMatrix = cost; % Ma trận chi phí cuối cùng
nextMatrix = next; % Ma trận truy vết đường đi
% Kiểm tra chu trình âm
negativeCycle = [];
for i = 1:numNodes
    if cost(i, i) < 0  % Phát hiện chu trình âm
        negativeCycle = tao_chu_trinh_am(i, next);
        shortestPath = [];
        totalCost = -inf;
        return;
    end
end
% Nếu không tồn tại đường đi
if isnan(next(startIndex, endIndex))
    shortestPath = [];
    totalCost = inf;
    return;
end
% Tạo đường đi ngắn nhất
shortestPath = startIndex;
while startIndex ~= endIndex
    startIndex = next(startIndex, endIndex);
    shortestPath = [shortestPath, startIndex];
end
totalCost = cost(shortestPath(1), shortestPath(end));
end

% Hàm tái tạo chu trình âm
function cycle = tao_chu_trinh_am(node, next)
cycle = node;
current = next(node, node);
while current ~= node && ~ismember(current, cycle)
    cycle = [cycle, current];
    current = next(current, node);
end
cycle = [cycle, node];
end

% Hàm in kết quả
function in_ket_qua(shortestPath, totalCost, startIndex, endIndex, nodeNames, negativeCycle, finalCostMatrix, nextMatrix)
fprintf('Ma trận chi phí cuối cùng:\n');
disp(finalCostMatrix);
fprintf('Ma trận truy vết đường đi:\n');
disp(nextMatrix);
% Nếu có chu trình âm hoăc không có đường đi ngắn nhất
if isempty(shortestPath)
    if isempty(negativeCycle)
        fprintf('Không có đường đi ngắn nhất từ %s đến %s.\n', nodeNames{startIndex}, nodeNames{endIndex});
        return;
    else
        fprintf('Không có đáp án, vì đồ thị có chu trình âm là: ');
        for i = 1:length(negativeCycle) - 1
            fprintf('%s -> ', nodeNames{negativeCycle(i)});
        end
        fprintf('%s\n', nodeNames{negativeCycle(end)});
    end
    return;
end
% In đường đi ngắn nhất
fprintf('Đường đi ngắn nhất từ %s đến %s là: \n', nodeNames{startIndex}, nodeNames{endIndex});
for i = 1:length(shortestPath)-1
    fprintf('%s -> ', nodeNames{shortestPath(i)});
end
fprintf('%s\n', nodeNames{shortestPath(end)});
% In chi phí đường đi
fprintf('Tổng chi phí đường đi: %d\n', totalCost);
end

function data6 = dailytomonthly(filename)
T = filename;
t = length(data(:,1));
% row
k = length(data(1,:));
% column
data1 = data;
for i = 2:k;
    data1(1,i) = 1*(1+data(1,i)/100);
    for j = 2:t;
%         2 is to take into account the titles, but shouldn't tablearray get rid of those?
        data1(j,i) = (data(j,i)/100+1)*data1(j-1,i);
%         aggregates the returns into monthly
    end
end
data2 = fints(data1);
% doesn't data already have all dates removed
data3 = tomonthly(data2);
% turns to monthly
data4 = fts2mat(data3);
h = length(data4(:,1));
% row
k = length(data4(1,:));
% column
data5 = zeros(h,k);
% create empty matrix
for i = 1:k;
    data5(1,i) = data4(1,i)-1;
%     puts the values into the new matrix in .0 numbers 
    for j = 2:h;
        data5(j,i) = (data4(j,i)/data4(j-1,i))-1;
%         monthly change in return then subtract 1
    end
end
data6 = data5;
output = array2table(data5);

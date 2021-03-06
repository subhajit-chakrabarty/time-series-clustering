function er=Calculate_error_rate(c,p)
% error_rate=  ratio of number of misclassified objects, which belong to
% neighbors set NS (and has different class with their candidate to the
% size of dataset.
rows=length(c);
a_count=0; % True Positive. (TP) decision assigns two similar documents to the same cluster
b_count=0; % False Positive. (FP) decision assigns two dissimilar documents to the same cluster
c_count=0; % False Negative. (FN) decision assigns two similar documents to different clusters
d_count=0; % True Negative. (TN) decision assigns two dissimilar documents to different clusters

for i=1:rows
    for j=i:rows
        if (c(i)==c(j) && p(i)==p(j))
            a_count=a_count+1;
        elseif (c(i)==c(j) && p(i)~= p(j))
            b_count=b_count+1;
        elseif (c(i)~=c(j) && p(i)== p(j))
            c_count=c_count+1;
        elseif (c(i)~=c(j) && p(i)~= p(j))
            d_count=d_count+1;
        end
    end
end
er=b_count/rows;
end


function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 

m = size(X, 1);
num_labels = size(all_theta, 1);

p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1), X];

value = sigmoid(X*all_theta');
for i=1:num_labels
vv = value(:, i);
index = vv == max(value, [], 2);
p(index) = i;
end

end

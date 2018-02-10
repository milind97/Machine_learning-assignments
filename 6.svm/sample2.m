temp = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
error = [];
minerr = 100;
for i = 1:length(temp)
  Ctemp = temp(i);
  for j = 1:length(temp)
	sigmatemp = temp(j);
	model= svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
	predictions = svmPredict(model, Xval);
	err = mean(double(predictions ~= yval));
	error = [error err];
	if err < minerr
	  minerr = err;
	  C = Ctemp;
	  sigma = sigmatemp;
	end;
 end;
end;
C
sigma
error
minerr
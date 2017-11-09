% perceptron - Perceptron demo with random training set.

% Calculate and plot the training set.
NPATS = 4 ;#2+floor(rand(1)*5);
Patterns = [0 1 0 1; 0 0 1 1]; #rand(2,NPATS)*2-1;
slope = log(rand(1)*10);
yint = rand(1)*2-1;
Desired = [1 0 0 1];#Patterns(2,:) - Patterns(1,:)*slope - yint  > 0;

PlotPats(Patterns,Desired)

Inputs = [ones(1,NPATS); Patterns];
Weights = [0 0 0];
numIters=100;

for i = 1:numIters

  Result = (Weights * Inputs) > 0.5;

  if Result == Desired, break, end

  Weights = Weights + (Desired-Result) * Inputs';
  fprintf('%2d.  Weights = ',i);
  disp(Weights);

  PlotBoundary(Weights,i,0)
  pause(1)

end

PlotBoundary(Weights,i,1)
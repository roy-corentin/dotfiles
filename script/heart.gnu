set parametric
set trange [0:2*pi]

# Define equations for x and y coordinates of the heart shape
x(t) = 16*sin(t)**3
y(t) = 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)

# Plot the heart shape
plot x(t), y(t) with lines title "Heart Shape"

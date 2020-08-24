# Riley Payung
# cds 251
# 04/30/2020
# Lab 13
# The purpose of this lab is to draw out a cannonball trajectory,
# Updating the graph as we go along.


Draw_Cannonball <- function() {
  # variable Declaration
  y0 <- 0.0
  x0 <- 0.0
  vy <- 0.0
  vx <- 0.0
  g <- 9.8
  h <- 0.01
  V <- 0.0
  theta <- 0
  t <- 0.0
  # Set the initial x and y (0,0);
  x <- x0
  y <- y0
  # Ask the user for input.
  print("Please enter the total velocity:");
  V <- scan(n=1);
  print("Please enter the angle of the shot:")
  theta <- scan(n=1);
  # Set the velocities
  vx <- V * cos(((pi * theta) / 180.0))
  vy <- V * sin(((pi * theta) / 180.0))
  # plot the initial values
  plot(x,y,xlim = c(0,50), ylim = c(0,10))
  # loop through the simulation
  while (TRUE) {
    # calculate the height at the current time, the new velocity, and the new x at the current time.
    y <- y + h * vy;
    vy <- vy - h * g;
    x <- x + h * vx;
    # replot the points on the same visualization
    points(x,y);
    # set t to its new value.
    t <- t + h
    # if y is less than 0, break.
    if (y < 0.0) { 
      break;
    }
    Sys.sleep(0.02);
  }
  # print out the values for the time aloft and the total distance traveled.
  print(paste("total Time Aloft:",as.character(t)));
  print(paste("Total Distance Traveled:",as.character(x)));
}

Draw_Cannonball();

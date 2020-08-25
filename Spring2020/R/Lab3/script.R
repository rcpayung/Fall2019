gini <- function(left, right) {
   total <- abs(left) + abs(right)
   p_left <- left/total
   p_right <- right/total
   G <- p_left * (1 - p_left) + p_right * (1-p_right)
   return(G)
}

entropy <- function(left,right) {
  total <- abs(left) + abs(right)
  if (abs(left) != 0)
    p_left <- left/total
  else
    p_left <- 0
  if (abs(right) != 0)
    p_right <- right/total
  else
    p_right <- 0
  E <- -p_left * log(p_left,base = 2) - p_right * log(p_right,base=2)
  return(E)
}

mError <- function(left, right) {
  total <- abs(left) + abs(right)
  p_left <- left/total
  p_right <- right/total
  M <- 1 - max(p_left,p_right)
  return(M)
}
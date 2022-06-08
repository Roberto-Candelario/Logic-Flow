# Making coices with if Statements

priceCalculator <- function(hours, pph = 40) {
  net.price <- hours * pph
  round(net.price)
}

# With if statement
priceCalculator <- function(hours, pph= 40) {
  net.price <- hours * pph
  if(hours > 100) { # Normal If statement
    net.price <- net.price * 0.9
  }
  round(net.price)
}

priceCalculator <- function(hours, pph= 40) {
  net.price <- hours * pph
  if(hours > 100) net.price <- net.price * 0.9 # one line if statement
  
  round(net.price)
}

# Else statements 

priceCalculator <- function(hours, pph= 40, public=TRUE) {
  net.price <- hours * pph
  if(hours > 100) net.price <- net.price * 0.9
  if(public) {
    tot.price <- net.price * 1.06
  } else {
    tot.price <- net.price * 1.12
  }
  round(tot.price)
}


priceCalculator <- function(hours, pph= 40, public=TRUE) {
  net.price <- hours * pph
  if(hours > 100) net.price <- net.price * 0.9
  if(public) tot.price <- net.price * 1.06 else 
    tot.price <- net.price * 1.12
  round(tot.price)
}


# Making the if.. else statement shorter
priceCalculator <- function(hours, pph= 40, public=TRUE) {
  net.price <- hours * pph
  if(hours > 100) net.price <- net.price * 0.9
  tot.price <- net.price * if(public) 1.06 else 1.12
  round(tot.price)
}




# Vetorizing Choices


#understanding how it works
ifelse(c(1,3) < 2.5, 1:2, 3:4)


# Trying it out
my.hour <- c(25, 110)
my.hour * 40 * ifelse(my.hour > 100, 0.9, 1)

priceCalculator <- function(hours, pph= 40, public) {
  net.price <- hours * pph
  net.price <- net.price * ifelse(hours > 100, 0.9, 1)
  tot.price <- net.price * ifelse(public, 1.06, 1.12)
  round(tot.price)
}
clients <- data.frame(hours= c(25, 110, 125, 40),
                     public= c(TRUE, TRUE, FALSE, FALSE))

with(clients, priceCalculator(hours, public= public))


# Making multiple choices
priceCalculator <- function(hours, pph= 40, public, client) {
  net.price <- hours * pph
  net.price <- net.price * ifelse(hours > 100, 0.9, 1)
  if(client == "private") {
    tot.price <- net.price * 1.12 #12% VAT
  } else if (client == "public") {
      tot.price <- net.price * 1.06 # 6% VAT
    } else {
      tot.price <- net.price * 1 # 0% VAT
    }
  round(tot.price)
}


priceCalculator <- function(hours, pph= 40, public, client) {
  net.price <- hours * pph
  net.price <- net.price * ifelse(hours > 100, 0.9, 1)
  if(client == "private") 1.12 else 
    if( client == "public") 1.06 else 1
  round(tot.price)
}


# Create it for vectorization
priceCalculator <- function(hours, pph= 40, public, client) {
  net.price <- hours * pph
  net.price <- net.price * ifelse(hours > 100, 0.9, 1)
 VAT <- ifelse(client == "private", 1.12,
               ifelse(client == "public", 1.06, 1))
 tot.price <- net.price * VAT
  round(tot.price)
}


# Switching between possibilities

priceCalculator <- function(hours, pph= 40, public, client) {
  net.price <- hours * pph
  net.price <- net.price * ifelse(hours > 100, 0.9, 1)
  VAT <- switch (client,
    private = 1.12,
    public = 1.06,
    abroad = 1)
  tot.price <- net.price * VAT
  round(tot.price)
}

# using default values in switch
priceCalculator <- function(hours, pph= 40, public, client) {
  net.price <- hours * pph
  net.price <- net.price * ifelse(hours > 100, 0.9, 1)
  VAT <- switch (client,
                 private = 1.12,
                 public = 1.06, 1)
  tot.price <- net.price * VAT
  round(tot.price)
}



# Testing out
client <- "other"
switch(client, private= 1.12, public= 1.06, 1)


# Calculating values in a for loop

# Using the values of the vector

priceCalculator <- function(hours, pph= 40, client) {
  net.price <- hours * pph * ifelse(hours > 100, 0.9, 1) 
  VAT <- numeric(0)
  for(i in client) {
    VAT <- c(VAT, switch (i,
      private = 1.12,
      public= 1.06, 1))
  }
  
  tot.price <- net.price * VAT
  round(tot.price)
}

# Testing the new priceCalculator
clients$type <- c("public", "abroad", "private", "abroad")
priceCalculator(clients$hours, client= clients$type)

# using loops and indices
# more efficient cvode
priceCalculator <- function(hours, pph= 40, public, client) {
  net.price <- hours * pph
  net.price <- net.price * ifelse(hours > 100, 0.9, 1)
  nclient <- length(cleint)
  VAT <- numeric(nclient)
  for(i in seq_along(client)) {
    VAT[i] <- switch(client[i], private = 1.12, public= 1.06, 1)
  }
  round(tot.price)
}


# Looping without loops: MEETING the apply family
# Counting birds
counts <- matrix(c(3,2, 4, 6, 5, 1, 8, 6, 1), ncol= 3) 
colnames(counts) <- c("sparrow", "dove", "crow")
counts


apply(counts, 2, max)

# Dealign with NA
counts[2, 2] <- NA

apply(counts, 2, max, na.rm= TRUE)  # na.rm= TRUE ignores the NA


sapply(c("a", "b"), switch, a = "Hello", b= "Goodbye")


# Replacing a complete for loop with a single statement
priceCalculator <- function(hours, pph= 40, client) {
  net.price <- hours * pph * ifelse(hours > 100, 0.9, 1)
  
  VAT <- sapply(client, switch, private= 1.12, public= 1.06, 1)
  
  tot.price <- net.price * VAT
  round(tot.price)
}


sapply(clients, unique) 













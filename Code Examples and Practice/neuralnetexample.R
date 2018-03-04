
# Code adapted from http://www.kdnuggets.com/2016/08/begineers-guide-neural-networks-r.html

install.packages('ISLR')
library(ISLR)

print(head(College,2)) # College data set contained within ISLR


# Create Vector of Column Max and Min Values
maxs <- apply(College[,2:18], 2, max)
mins <- apply(College[,2:18], 2, min)

# Use scale() and convert the resulting matrix to a data frame
scaled.data <- as.data.frame(scale(College[,2:18],center = mins, scale = maxs - mins))

# Check out results
print(head(scaled.data,2))


# Convert Private column from Yes/No to 1/0
Private = as.numeric(College$Private)-1
data = cbind(Private,scaled.data)

library(caTools)
set.seed(101)

# Create Split (any column is fine)
split = sample.split(data$Private, SplitRatio = 0.70)

# Split based off of split Boolean Vector
train = subset(data, split == TRUE)
test = subset(data, split == FALSE)

feats <- names(scaled.data)

# Concatenate strings
f <- paste(feats,collapse=' + ')
f <- paste('Private ~',f)

# Convert to formula
f <- as.formula(f)

f

install.packages('neuralnet')
library(neuralnet)
nn <- neuralnet(f,train,hidden=c(10,10,10),linear.output=FALSE)

plot(nn) # There has to be a ggplot2-connected (tidyverse?) package for 
         # this visualization, but I haven't found it yet. 
         # SCRATCH THAT. SEE BELOW. 

# Compute Predictions off Test Set
predicted.nn.values <- compute(nn,test[2:18])

# Check out net.result
print(head(predicted.nn.values$net.result))
predicted.nn.values$net.result <- sapply(predicted.nn.values$net.result,round,digits=0)

table(test$Private,predicted.nn.values$net.result)
# From here you can establish an error rate; 
# in my example, it's 218/233 for a 93.6% accuracy rate
# but of course your mileage will vary. 


library(NeuralNetTools) # via 
url3<-"https://beckmw.wordpress.com/2014/12/20/neuralnettools-1-0-0-now-on-cran/"


# basic plotting is easy: 
plotnet(nn, alpha.val=0.8)
garson(nn) # this algorithm apparently only works with 1 H layer
lekprofile(nn) # same here what gives? 




## plotting the relative importance of predictor variables:
# (probably doesn't work for multiple layers but whatever)
##
#create model
library(nnet)
mod1<-nnet(rand.vars,resp,data=dat.in,size=10,linout=T)

##
#relative importance function
library(devtools)
source_url('https://gist.github.com/fawda123/6206737/raw/2e1bc9cbc48d1a56d2a79dd1d33f414213f5f1b1/gar_fun.r')

#relative importance of input variables for Y1
rel.imp<-gar.fun('Y1',mod1,bar.plot=F)$rel.imp

#color vector based on relative importance of input values
cols<-colorRampPalette(c('green','red'))(num.vars)[rank(rel.imp)]

##
#plotting function
source_url('https://gist.githubusercontent.com/fawda123/7471137/raw/466c1474d0a505ff044412703516c34f1a4684a5/nnet_plot_update.r')

#plot model with new color vector
#separate colors for input vectors using a list for 'circle.col'
plot(mod1,circle.col=list(cols,'lightblue'))
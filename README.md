## NCAA March Madness Bracket Predictions

Zack, I saw your face light up a bit in class when I mentioned this so I figure it's right up your alley. Matt, while you aren't in class with Zack and me and didn't see the gauntlet thrown down (our professor invited us into his bracket pool), I think you'd find this a fun problem to work on. Plus the idea of doing this without your big old brain feels just *wrong*. 

### The Team
__Andrew__: A PhD student in Research, Statistics, and Evaluation with an interest in machine learning and a bit too much free time now that his spring break plans were canceled. 

__Danil__: ~~A Russian hacker~~ A coder with machine learning skills and a data miner extraordinaire.

__Matt__: A friend with killer skills in python and economics and the best practical problem-solving skills I've ever seen put to use. 

__Zack__: A classmate (and friend!) who teaches Math at the community-college level and with a degree in philosophy to boot. Doesn't miss the forest for the mathematical trees. 

I think the three of us can destroy it, but what's the scenario? 

-------------------------------------------------------------------

Okay gents, NCAA, Google, and Kaggle teamed up to host a competition for the best AI-predicted March Madness bracket. I don't want to jump into *that* competition because I don't have the time or effort to really give it a proper go. Having said that, they've made a whole buttload of data available for us to use for predictive modeling, and I would like to see how good of a model we can make with just these data and our brains.

There are a few problems if we take on this challenge, and one of these is the structuring of the data--about two dozen data sets full of strange variables, across multiple years, etc. Just *getting* the data into a useable frame is going to be a battle. After this, we need to decide how exactly we are going to model the data. 

![Different algorithmic results](http://scikit-learn.org/stable/_images/sphx_glr_plot_classifier_comparison_001.png)

For me, it makes most sense to use a neural net--but I could be biased because of prior use and familiarity--to model either a probability of winning overall for a given team or to model team vs. team logistic outcomes. 
The team-vs-team aspect of this is also new for me: I've never had to predict anything quite like it before. I'd like our first discussion, if we decide to take this on, to be about how exactly we can use predictive modeling within a tournament framework. It's not immediately obvious to me which way to do this. A naiive answer might be to say, "create a predictive model which ranks all the teams in the NCAA and then apply those ranks to the teams themselves and the highest-ML-ranked team wins each matchup until it's over" but this doesn't take into account the pecularities of the team-vs-team structure of the problem. 

If you're game, I welcome your thoughts. Dr. Youngs said that he expects us to enter the competition by our next class, and that means Thursday the 15th. 

:) 

## Formalities
* [The full description can be found here](https://www.kaggle.com/c/mens-machine-learning-competition-2018/data)

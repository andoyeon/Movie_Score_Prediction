library(randomForest)
set.seed(123)
mov_model3 <- randomForest(imdb_score ~ ., data = movie, importance = T)
print(mov_model3)
importance(mov_model3)
varImpPlot(mov_model3)

load("data/project/movie.rda")
# IMDB score에 영향력 top3 변수
# 1) duration
# 2) 감독 이름 , 좋아요 수
# 3) 영화 좋아요 수

search()
library(ggplot2)
str(movie)
summary(movie[c("director_name", "duration", "director_facebook_likes", "movie_facebook_likes")])

# duration
ggplot(movie, aes(duration, imdb_score)) +
  geom_col(col = "#FFCC00")

# 감독 좋아요 수
ggplot(data = movie, mapping = aes(x = director_facebook_likes, y = imdb_score,
                                   color = color)) +
  geom_point()

# 영화 좋아요 수
ggplot(movie, aes(x=movie_facebook_likes, y=imdb_score, color = language)) +
  geom_point()

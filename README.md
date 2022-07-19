[![Build Status](https://travis-ci.org/simplesteph/kafka-streams-course.svg?branch=master)](https://travis-ci.org/simplesteph/kafka-streams-course)

# Learning

This is a companion repository for my [**Kafka Streams course on Udemy**](https://www.udemy.com/kafka-streams/?couponCode=GITHUB)

Happy learning!

<p align="center">
    <a href="https://www.udemy.com/kafka-streams/?couponCode=GITHUB">
        <img src="http://i.imgur.com/YRJijb0.png" alt="Kafka Streams Course Logo"/>
    </a>
</p>

# Content

 - Starter project with dependencies
 - Word Count to learn the basic API
 - Favourite Colour for a more advanced example (`Scala` version included)
 - Bank Balance to demonstrate exactly once semantics
 - User Event matcher to learn about joins between `KStream` and `GlobalKTable`.

## Run local kafka
```sh
docker run -p 2181:2181 -p 9092:9092 --name kafka-docker-container --env ADVERTISED_HOST=127.0.0.1 --env ADVERTISED_PORT=9092 spotify/kafka
```
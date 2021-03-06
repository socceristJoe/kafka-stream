#!/bin/bash
cd /Users/joeqiao/Documents/LocalHub/kafka/kafka_2.13-2.8.1

# create input topic with two partitions
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 2 --topic word-count-input

# create output topic
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 2 --topic word-count-output

# launch a Kafka consumer
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
    --topic word-count-output \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.LongDeserializer

# launch the streams application

# then produce data to it
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic word-count-input

# package your application as a fat jar
cd /Users/joeqiao/Documents/LocalHub/kafka/kafka-stream/word-count
mvn clean package

# run your fat jar
java -jar /Users/joeqiao/Documents/LocalHub/kafka/kafka-stream/word-count/target/word-count-1.0-SNAPSHOT-jar-with-dependencies.jar

# list all topics that we have in Kafka (so we can observe the internal topics)
bin/kafka-topics.sh --list --zookeeper localhost:2181

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
    --topic wordcount-application-Counts-changelog \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.LongDeserializer

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 \
    --topic wordcount-application-Counts-repartition \
    --from-beginning \
    --formatter kafka.tools.DefaultMessageFormatter \
    --property print.key=true \
    --property print.value=true \
    --property key.deserializer=org.apache.kafka.common.serialization.StringDeserializer \
    --property value.deserializer=org.apache.kafka.common.serialization.LongDeserializer
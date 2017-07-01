# ballerina-notification-service
This is a Ballerina service that can be used to send SMSs via Clickatell and messages to Rocketchat.


#How to run the service
$ ballerina run service notifications.bal

#Sending SMS...
curl -v http://server-ip:9090/notify/sms -d '{"text":"Welcome to Ballerina","to":["+94<>"],"token":""}'

text -> SMS content to be sent
to -> Receipent Phone Number
token -> Valid Clicktell token to authenticate


#Posting Message to Rocketchat Channel...
curl -v http://server-ip:9090/notify/rocketchat -d '{"username":"Balerina","text":"Example message","token":"vpY8CBFqdxssqKJd9/jpGTZAHxWYsJvs3FtXpfkQ5o6PHicHbKxZPtTrZQnyQEN2yn"}'

username -> Username which need to send the message as.
text -> Content to post
token -> Valid Rocketchat token (Working Rocketchat token is provided herewith in a demo server)

#Demo Rocketchat Server
http://107.21.194.76:3000/
ballerina/ballerina!23




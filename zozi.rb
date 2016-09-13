# Zozi Messages
# Build a simple rails app that has two features:
#   1. A JSON API for creating messages that are stored in a database.
#     The message can be a maximum of 141 characters long.
#     The message should be associated (tagged) with any hashtags that are found in the body.
#     Example request:
#       POST /api/messages
#       { "body": "This is a message from #zozi" }
#       curl -H "Content-Type: application/json" -X POST -d '{ "body": "This is a message from #zozi" }'
#          http://localhost:3000/api/messages
#   2. An HTML endpoint ( /messages ) for displaying the messages, from newest to oldest. It should also display a list of hashtags found in messages, with the most frequently used first.
#      Use any gems you wish to help with development. Some tests would be nice as well.

import json
import os
import uuid
import boto3

dynamodb = boto3.resource("dynamodb")
table = dynamodb.Table(os.environ["TABLE_NAME"])


def response(status_code, body):
    return {
        "statusCode": status_code,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(body)
    }


def lambda_handler(event, context):
    method = event.get("requestContext", {}).get("http", {}).get("method", "")

    try:
        if method == "GET":
            result = table.scan()
            return response(200, {
                "message": "Items retrieved successfully",
                "items": result.get("Items", [])
            })

        if method == "POST":
            body = json.loads(event.get("body", "{}"))
            item_name = body.get("name")

            if not item_name:
                return response(400, {"error": "Missing required field: name"})

            item = {
                "id": str(uuid.uuid4()),
                "name": item_name
            }

            table.put_item(Item=item)

            return response(201, {
                "message": "Item created successfully",
                "item": item
            })

        return response(405, {"error": "Method not allowed"})

    except Exception as e:
        return response(500, {"error": str(e)})
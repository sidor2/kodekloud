### Building and Managing No SQL Databases with AWS Dynamo DB

1. Create a DynamoDB table named xfusion-tasks with a primary key called taskId (string).
2. Insert the following tasks into the table:
- Task 1: taskId: '1', description: 'Learn DynamoDB', status: 'completed'
- Task 2: taskId: '2', description: 'Build To-Do App', status: 'in-progress'
3. Verify that Task 1 has a status of 'completed' and Task 2 has a status of 'in-progress'.
4. Ensure the DynamoDB table is created successfully and that both tasks are inserted correctly with the appropriate statuses.

```
aws dynamodb get-item --table-name xfusion-tasks --key '{"taskId": {"S": "1"}}'
aws dynamodb get-item --table-name xfusion-tasks --key '{"taskId": {"S": "2"}}'
```

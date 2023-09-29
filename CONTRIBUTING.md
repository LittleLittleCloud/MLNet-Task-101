# Contributing to ML.Net Task 101

Thank you for your interest in contributing to ML.Net Task 101! You can contribute mainly in two ways:

- [Create a new task](#create-a-new-task)
- [Improve an existing notebook](#improve-an-existing-notebook)

## Create a new task
To create a new task, you can follow the steps below:
- create a folder under `./` with the task name. For example, if you want to create a task called `Anomaly Detection with PCA`, you can create a folder called `Anomaly Detection with PCA` under `./`. The folder name should be the same as the task name.
- under the task folder, create a file called `label.json`. The content of `label.json` should contain a `name` field, a `description` field and a `output` field at minial, for example:
```json
{
    "name": "a short and concise task name",
    "description": "detail description of the task.",
    "output": "output artifact of the task, for example, a ml.net model file. We will use this output to verify the correctness of the solution."
}
```
- You can also add more fields to `label.json` to provide more information about the task, like author, date, etc. We don't have a strict requirement on what fields should be added to `label.json` as long as it contains `name`, `description` and `output` fields.

- if the task requires any input artifact, like dataset. Put them under the same task folder. For example, if the task requires a dataset called `iris.csv`, you can put it under `./Anomaly Detection with PCA/iris.csv`.
- create a pull request to this repo. We will review your pull request and merge it if everything looks good.

## Improve an existing notebook
We welcome any improvement to the existing notebooks. For example, you can improve the notebook by breaking down a long cell into multiple cells, or you can improve the notebook by adding more comments to explain the code. Those improvements will help readers to better understand the notebook and for large language model to better generate the notebook in the future.
After you make the improvement, please create a pull request to this repo. We will review your pull request and merge it if everything looks good.

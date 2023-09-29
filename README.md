# ML.Net Task 101

Home for a series of [ML.Net](https://github.com/dotnet/machinelearning) tasks and its notebook solutions.

[![CI](https://github.com/LittleLittleCloud/MLNet-Task-101/actions/workflows/ci.yml/badge.svg)](https://github.com/LittleLittleCloud/MLNet-Task-101/actions/workflows/ci.yml)

## Disclaimer
All tasks and solutions are created by Large Language Model (LLM) in 99%. It may contain errors. Please use at your own risk.
After notebook is generated, we will manually review the notebook and make sure it is runnable. If there're mistakes we'll manually fix it and that's where the 1% happen. We do expect that after more and more tasks generated, we can eliminate the 1% in the end.
We do not guarantee the correctness of the notebook solution. If you find any error, please feel free to submit a PR.

## About ML.Net Task 101
ML.Net Task 101 is a series of tasks that help you get started with ML.Net. Each task will have a notebook solution that will help you to understand the task and its solution.
This project is still in its early stage and LLM will keep adding more tasks and solutions until either the number of tasks reaches 101 or we run out of money to pay OpenAI.

## Task generation
Each task is created via three steps:
- task generation: currently, we use gpt-4 to generate a tasks which contains task name and description. A generated task can be found [here](./Anomaly%20Detection%20with%20PCA/result.json). We are also welcome to any manully-created task. If you want to create a task, please check out our [contribution guide](./CONTRIBUTING.md).
- mlnet solution generation: we create a multi-agent group to generate a runnable ML.Net solution for each task. The multi-agent group contains four agents: An admin agent to describe the task, an engineer agent to generate the ML.Net solution, an executor agent to compile and run engineer's solution and an examplar agent to provide mlnet examples either from [ML.Net example folder](https://github.com/dotnet/machinelearning/tree/main/docs/samples), or from recently-created ml.net task 101. We provide complete chat history on how the solution is generated, saved as 'chat_history.json'. An example can be found [here](./Anomaly%20Detection%20with%20PCA/chat_history.json).
- notebook generation: once the solution is generated, we create a two-agent group to convert csharp code to [interactive notebook](https://github.com/dotnet/interactive). Similar to the previous step, we provide complete chat history on how the notebook is generated, saved as 'create_notebook_history.json'. An example can be found [here](./Anomaly%20Detection%20with%20PCA/create_notebook_history.json).

Once a task is successfully created and its notebook is generated, the examplar agent will add the task to its knowledge base to better address more related tasks in the future.

## How to contribute
We welcome any contribution to this project. You can contribute mainly in two ways:
- Create a new task
- Improve an existing notebook

For more details, please check out our [contribution guide](./CONTRIBUTING.md).

## About multi-agent group chat
We address multi-agent group chat heavily on generating executable mlnet solution and its associated notebook. To better understand how the multi-agent group chat works, please check out our library:[AutoGen](https://github.com/microsoft/autogen) and corresponding paper [AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation Framework](https://arxiv.org/abs/2308.08155).

## About ML.Net
ML.NET is a cross-platform, machine learning framework for .NET developers. Model Builder is the UI tooling in Visual Studio that uses Automated Machine Learning (AutoML) to train and consume custom ML.NET models in your .NET apps. You can use ML.NET and Model Builder to create custom machine learning models without having prior machine learning experience and without leaving the .NET ecosystem. ML.NET Model Builder supports AutoML, which automatically explores different machine learning algorithms and settings to help you find the one that best suits your scenario.

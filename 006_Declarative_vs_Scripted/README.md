# Declarative vs Scripted Pipelines

Lot of Developers, DevOps folks and engineers use Jenkins. And they prefer Jekins pipelines over freestyle jobs. These pipelines are written in two ways:

1. Declarative Pipelines
2. Scripted Pipelines

Let's understand the difference between these two.


| Declarative Pipelines  | Scripted Pipelines |
| ------------- | ------------- |
| 1. Declarative is recent and advanced style of writing a pipeline.  | 1. When Pipeline were initially introduced, Groovy was selected as the foundation. This traditional way to build pipelines using Groovy is now known as the "Scripted Pipeline" or DSL(Domain Specific Language).  |
| 2. Groovy is not preferred choice of all developers, therefore this is accepted more now. Declarative pipeline limits what is available to the user with a more strict and pre-defined structure, making it an ideal choice for simpler CI/CD pipelines. | 2. A scripted pipeline is a fully-featured programming environment. Scripted Pipeline offers a tremendous amount of flexibility and extensibility to Jenkins users.  |
| 3. This can be integrated with Blue Ocean.  | 3. Blue Ocean support is not there with Scripted pipelines.  |
| 4. Declarative pipeline supports code validation. In case of any syntax errors, the user will get an error at the start of the execution.  | 4. This does not support code validation. It will throw error only when that particular step is getting executed.  |
| 5. It offers a feature to restart from specific stage.  | 5. It doesn't offer this feature.  |
| 6. It bring a "When" block that can skip the whole stage if a condition is not met. | 6. Here, we need to achieve this using if else conditions.  |
| 7. Here we have Envionment variables. | 7. Here we use global variables.  |
| 8. It supports execution of scripts in a block called "script".  | 8. It does not support execution of declarative blocks.  |


<p align="center">
<a href="https://www.youtube.com/c/xtremeexcel?sub_confirmation=1"><img src="/images/subscribe.gif" width="30%" height="30%"></a>
</p>

# TerraformCloud

---

## Shorcots visualStudio
1. Wrap word : Ctrl+E, Ctrl+W
2. double tab : Auto Compiling

---

## Symboles
1. $ : string interpolation

---

## Requirements
1. [Visual Studio Community 2022](https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&channel=Release&version=VS2022&source=VSLandingPage&cid=2030&passive=false)
    a. [Worloads](ASP.NET & web development)
---

## NewProject
1. Language : C#
2. Console
3. Console App
4. Framework: .net 6.0 LTS
5. Tools\NuGet Package Manager\Package Manager Console :
`Install-Package Azure.Messaging.ServiceBus`

---

### Program.cs
````cs
// Import the namespace for interacting with Azure Service Bus

// Namespace for the Service Bus Console application

    // internal class program

        // variables : connection string & queueName from the SAS policy

        // service bus client instance (connectionString)

        // sender instance using the service bus for the queue

        // method is where the program execution begins

            // Create a message batch instance (class) using the Sender

            // add 10 messages to the message Batch

                // try to add a message to the batch with string : Message <number>

                    // if it's too large for batch, show this message "The message <n> is too large to fit in the batch"

            // use the serviceBusSender client to send the batch of messages to the service bus queue
            
            // write in the console : A batch of 10 messages has been published to the queue

            // show in the console

            // closing the connections & network resource
````

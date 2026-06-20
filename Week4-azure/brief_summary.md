# Azure Data Factory Pipeline

Brief Summary:

In this assignment, Azure cloud services were explored by creating a Resource Group and a Storage Account with Blob Storage containers. 

A CSV file was uploaded to the source container and Azure Data Factory was created to build a data pipeline.

A Linked Service was configured to connect ADF with Blob Storage, and source and destination datasets were created. A Get Metadata activity was used to validate file information, followed by a Copy Data activity to transfer the CSV file from the source container to the destination container. 

The pipeline executed successfully, and the data was copied to the destination location. 

IAM roles such as Reader and Storage Blob Data Contributor were assigned to manage access and permissions.

## Workflow

Blob Storage (Source CSV) → Get Metadata → Copy Data → Blob Storage (Destination)

## Output

* Pipeline executed successfully.
* Data copied to destination container.
* Metadata validated successfully.









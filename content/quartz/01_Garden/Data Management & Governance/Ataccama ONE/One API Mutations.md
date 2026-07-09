GraphQL utilizes mutations, specifically designed for operations that modify server-side data.
A full data platform needs both data fetching and modification mechanisms, making mutations essential in GraphQL.
With mutations, developers can define custom operations tailored to their specific data modification needs, enhancing flexibility and control.
Mutations can return the state of the job and as well as the modified object, including nested fields, allowing retrieval of the updated object's state.
While queries are executed in parallel, mutations are executed in series, ensuring sequential handling of data modifications.
In REST, any request might induce server-side changes, but conventions discourage using GET requests for data modification. Similarly, GraphQL promotes explicit mutation operations for write operations.
Mutations support various types of data modifications, including create, update, delete, and custom actions, offering versatility in application development.


Running DQ evaluations
You can run data quality evaluation on a catalog item, a specific column in a catalog item, or a glossary term.
Depending on the entity type, you need to provide the corresponding identifier.
In these cases, the operation type is mutation.
For more information about retrieving correct identifiers for each entity type, see List entities.

GraphQL operation for DQ evaluation on catalog item attributes
mutation catalogItemAttributeDQ {
    attributeEvaluateDq(gid: <catalog_item_attribute_id>) {
        gid
    }
}

GraphQL operation for DQ evaluation on glossary terms
mutation glossaryTermDQ {
    termEvaluateDq(gid: <glossary_term_identifier>) {
        gid
    }
}


Running DQ evaluations
All DQ evaluation operations return the same response format with the identifier of the DQ evaluation job (gid).
The name of the first field under data matches the executed mutation (for example: catalogItemEvaluateDq).
In all cases, the operation is expected to return the job identifier.
You can further customize what the operation returns as needed.
GraphQL operation for DQ evaluation on catalog items
mutation catalogItemDQ {
    catalogItemEvaluateDq(gid: <catalog_item_id>) {
        gid
    }
}

Running DQ evaluation on a catalog item operation response body
{
    "data": {
        "catalogItemEvaluateDq": {
            "gid": "e80174ca-a512-40e0-8975-b1417a63b4a9"
        }
    }
}



Deleting entities
Deleting an entity requires first creating a delete draft and then publishing it.
The operation requires the identifier of the entity.
To delete a catalog item attribute, replace the root item catalogItemDelete with attributeDelete.
When deleting a glossary term, use termDelete instead.
GraphQL operation for deleting catalog items
mutation deleteEntity {
    catalogItemDelete(gid: 
    "0726c74e-fc9e-40ad-a29d-23ec1dac8769") {
        success
    }
}

The query returns the following structure:


Deleting catalog items operation response body
{
    "data": {
        "catalogItemDelete": {
            "success": true
        }
    }
}


Publishing entities
The mutation publishEntity allows publishing any MMD node.
Currently, it bypasses the publishing workflow, automatically resolving approval requests (expected to change later).
When publishing attributes, the root item should be attributePublish. For glossary terms, use termPublish.
If the field result is added as shown in the example, the operation returns the name of the published node.
Result field type depends on the entity type.
GraphQL operation for publishing entities
mutation publishEntity {
    catalogItemPublish(gid: "0726c74e-fc9e-40ad-a29d-23ec1dac8769") {
        success
        result {
            publishedVersion {
                name
            }
        }
    }
}

The content assist feature of GraphQL Playground can help you customize what the publishEntity mutation returns. To display all possible query options, press Ctrl+Space or start typing.


Publishing entities
The response is structured as follows:


Publishing entities operation response body
{
    "data": {
        "catalogItemPublish": {
            "success": true,
            "result": {
                "publishedVersion": {
                    "name": "customers.csv"
                }
            }
        }
    }
}
When publishing a delete draft, the operation returns a response in the following format:


Publishing a delete draft operation response body
{
    "data": {
        "catalogItemDelete": {
            "success": true,
            "result": {
                "publishedVersion": null
            }
        }
    }
}



Duplicating rules and terms
It is possible to duplicate the configuration of rules and terms.
This is useful when, for example, similar rules need to be assigned to multiple lookup files.
This operation only copies the configuration and does not include entity relationships, meaning the duplicated rule or term is not assigned anywhere.
When duplicating rules and terms, you need to specify the identifier (gid) of the term or rule you want to duplicate.
GraphQL query for duplicating terms
mutation copyTerm {
    termCopy(gid: "<term_ID>") {
        result {
            gid
        }
    }
}


Duplicating rules and terms
GraphQL Query for duplicating rules
mutation copyRule {
    ruleCopy(gid: "<rule_ID>") {
        result {
            gid
        }
    }
}

Duplicating a rule operation response body
{
    "data": {
        "ruleCopy": {
            "result": {
                "gid": "a0ceca7a-1653-4338-9054-8da4e45dcd7e"
            }
        }
    }
}


Topic Highlights
GraphQL utilizes mutations for server-side data modification operations.
Developers can define custom mutation operations tailored to specific data modification needs.
Mutations can return the state of the job and modified objects, including nested fields.
Unlike queries, mutations are executed sequentially to ensure proper data modification handling.
GraphQL encourages explicit mutation operations for data modification, similar to REST conventions.
Mutations support create, update, delete, and custom actions.
In ONE, mutations are used for tasks such as data quality evaluation, deletions, duplications, and publishing entities.
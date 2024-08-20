# Troubleshooting strategies for Percona Everest


This section is your go-to resource for tackling common issues and finding solutions. For additional troubleshooting tips and known issues, see the Percona Everest [Release Notes](../release-notes/release_notes_index.md) and [known limitations](../reference/known_limitations.md) section.



## Troubleshooting topics

We have sorted the troubleshooting topics into specific categories, making it easy for you to find the information you need.

### Installation

We leverage the [Operator Lifecycle Manager (OLM)](https://olm.operatorframework.io/) to manage the operators. OLM is deployed explicitly to the everest-olm namespace. 

The main components are:

- olm-operator
- catalog-operator
- packageserver.
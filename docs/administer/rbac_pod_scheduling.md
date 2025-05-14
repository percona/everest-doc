# Pod scheduling policies with RBAC

As an admin in Percona Everest, you can restrict access to configuring or applying specific Pod Scheduling Policies for certain users. To achieve this, you can use Percona Everest's RBAC (Role-Based Access Control) functionality to define access policies.

RBAC policies in Everest apply to the entire Pod Scheduling Policy, including all the affinity rules defined within it. 


!!! note
    Assigning RBAC permissions to individual affinity rules within a policy is impossible—access is managed at the policy level as a whole.


## Use cases for Pod Scheduling policies with RBAC

### Limited access to Pod scheduling policy configuration
As a Percona Everest Admin, you can allow only specific users to manage Pod Scheduling Policies (create, edit, read, and delete) while restricting other users to read-only access. These users can view and apply the existing policies to database clusters but cannot modify or delete them.

??? example "Example"
    Here’s an example of RBAC policy displaying how to grant full access to one user (e.g., alice) and read-only access to others:

    ```sh
    p, alice, pod-scheduling-policies, *, *
    p, role:team-dev, pod-scheduling-policies, read, *
    ```



### Limited usage of Pod scheduling policy by users

As a Percona Everest Admin, you can allow a particular user to use a specific Pod scheduling policy. The rest of the users are not allowed to use this policy at all (that is, they cannot see it in the system and cannot assign it to DB clusters that they create or modify).

??? example "Example"
    Here’s an example of RBAC policy that grants limited access to just one user (e.g., bob):
    
    ```sh
    p, bob, pod-scheduling-policies, read, pod-scheduling-policy-1
    ```







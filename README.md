# DataGrid

Create a data-grid namespace

`oc new-project data-grid`

Deploy the data grid operator

`oc apply -f data-grid-operator.yml`

Create an instance of data grid 

`oc apply -f data-grid-cluster.yml`

Locate the secret: example-infinispan-generated-secret and copy the developer password

Update the file rhdg-client-auth-secret.yml with the developer password

Create the rhdg-client-auth secret

`oc apply -f rhdg-client-auth-secret.yml`

Create the "offline-sessions" cache

`oc apply -f offline-sessions-cache.yml`

Ensure the cache is created correctly

# RH SSO configuration

Build an image from the included Dockerfile

Push the image to an image repository

Update the RH SSO deployment config as follows:

Add these environment variables:

```
           - name: DATAGRID_USERNAME
              value: developer
            - name: DATAGRID_PASSWORD
              value: <password copied previously>
```
Add these to the JAVA_OPTS_APPEND env variable

```
 -Dremote.cache.host=example-infinispan.data-grid.svc.cluster.local
                -Dremote.cache.port=11222
```

Update the image in the dc with the image we pushed in the previous step.

# Cross site data replication

To configure DataGrid for cross site replication, follow the steps [here](cross-site.md)

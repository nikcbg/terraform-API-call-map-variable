# terraform-API-call-map-variable

### Example repo on how to create map varibale in Terrfaorm Cloud (TFC) with API call.

# How to use this repo 
- have terraform installed on your computer 
- create TFC organization and user 
- create TFC workspace 
- clone the repo on your computer and `cd` into the cloned repo
- in this example, I am creating a map varibale in TFC using the `paylod.json` file:
  - the map varibale is called `amis` with the following values:
  - `us-east-1=ami-04b9e92b5572fa0d1`
  - `us-east-2=ami-0d5d9d301c853a04a`
  
- next you need to request the creattion of the map variable in TFC
  - you would need API TFC user token, check this [link](https://www.terraform.io/docs/cloud/users-teams-organizations/api-tokens.html#user-api-tokens) on how to genreate user token
- once you have the token execute `export TOKEN=your_TFC_user_token_here` command on your computer CLI
- next run the below code in your CLI:
    ```
    curl \
      --header "Authorization: Bearer $TOKEN" \
      --header "Content-Type: application/vnd.api+json" \
      --request POST \
      --data @payload.json \
      https://app.terraform.io/api/v2/vars
    
    ```
- after successful execution your map variable should ve created in TFC worspace

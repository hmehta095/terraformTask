module "prod" {
    source = "../modules/keyvault_and_storage"
    
    environment ={
        name           = "prd"
    }

        kms_key_alias={
        kms_key_alias = "prod-key"
    }

    storage_buckets_lrs ={
        name               = "my-storage-lrs"
        provider           = "aws.central"
        region             = "ca-central-1"
        access             = "private"
      }
    storage_buckets_ragr ={
        name               = "my-storage-ragrs"
        provider           = "aws.east"
        region             = "ca-east-1"
        access             = "public-read"
      }
}
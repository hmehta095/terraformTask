module "dev" {
    source = "../modules/keyvault_and_storage"
    
    environment ={
        name           = "dev"
    }
storage_buckets = [
    {
      name               = "my-storage-lrs"
      region             = "ca-central-1"
      public_access      = false
    },
    {
      name               = "my-storage-ragrs"
      region             = "ca-east-1"
      public_access      = true
    }
  ]
}


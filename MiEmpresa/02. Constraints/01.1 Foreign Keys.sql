ALTER TABLE <table_name>
    ADD CONSTRAINT [FK_Shipper_Products] 
        FOREIGN KEY ([<local_attr>]) REFERENCES [dbo].[<table_name]([<table_Id>])  
